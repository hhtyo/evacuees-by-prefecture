# encoding: utf-8

require 'tabula'
require 'date'

module Evacuees
  class PDFExtractor
    include FileConstants
    include TableConstants
    include CSVWriter

    attr_reader :uri, :path, :title, :description, :date, :header, :rows

    # @param [Hash] opts the options to create a PDF object with.
    # @option opts [Fixnum] :index
    # @option opts [String] :uri Overrides :index if provided
    # @options opts [String] :dir
    # @option opts [Range, Array<Fixnum>] :range
    def initialize(opts={})
      @uri = opts[:uri] || files[opts[:index]]
      dir = opts[:dir] || File.expand_path('../../data/pdf',  File.dirname(__FILE__))
      @path = File.expand_path(uri.split('/').last, dir)
      range = opts[:range] || 3..5
      caption, @rows = TabulaWrapper.new(path, range).extract
      @title = caption[title_re]
      @description = caption[description_re]
      @date = parse_date(title)
      # The coding changed with the 2014-02-13 data.
      @header = date < Date.new(2014,2,13) ? headers[0] : headers[1]

      refine_rows
    end

    private

    def parse_date(text)
      # 1. Extract the zenkaku Heisei year, month, and day.
      # 2. Transpose the zenkaku numbers with their single-byte counterparts.
      # 3. Split the extracted date into an array at the year and month kanji.
      # 4. Comvert the Heisei year to a Gregorian year.
      # 5. Zero pad the month and day.
      # 6. Join the date array into a string with a '-' separator.
      date_string = text[date_re]
        .tr('０-９', '0-9')
        .split(/[年月]/)
        .map.with_index { |column, index| index == 0 ? column.to_i + 1988 : column }
        .map.with_index { |column, index| index == 0 ? column : column.rjust(2, '0') }
        .join('-')

      Date.parse(date_string)
    end

    def refine_rows
      # Clean the extracted rows.
      rows.map! do |row|
        # 1. Transpose zenkaku characters with their single-byte counterparts.
        # 2. Remove carriage returns, white space, and commas.
        # 3. Delete empty columns.
        # 4. Delete the total column.
        # 5. Insert a space between a number and a footnote or
        #    calculated change in evacuees.
        # 6. Insert a space between a number and a prefecture name.
        # 7. Replace missing data columns with 'NA'.
        row.map { |column| column.tr('（）＋－ー，０-９　', '()+\-—,0-9 ') }
          .map { |column| column.gsub(/[\r\s,]/, '') }
          .reject { |column| column.empty? }
          .reject.with_index { |_, index| (row.length - 3) == index }
          .map { |column| column.gsub(/([0-9])(\()/, '\1 \2') }
          .map { |column| column.gsub(/^([0-9]{1,2})(\W{2,3}[都道府県]$)/, '\1 \2') }
          .map { |column| column.gsub(/^[-—]$/, 'NA')}
      end

      # Delete header and total rows.
      #--
      # TODO: Consistently extract table headers.
      #++
      rows.reject! { |row| row.first.match(/^[0-9]{1,2}\s\W{2,3}[都道府県]$/).nil? }

      # Delete the subtotal column (included in tables before 2011-11-17).
      rows.each { |row| row.delete_at(4) } if date < Date.new(2011,11,17)

      # Transform the cleaned rows.
      rows.map! do |row|
        notes = []

        # 1. Delete calculated changes in evacuees.
        # 2. Transform prefecture numbers and footnotes into columns.
        # 3. Delete empty columns.
        # 5. Insert each footnote column into a temporary array.
        # 5. Delete footnote columns.
        # 6. Insert a new footnotes column at the end of the row.
        row.map { |column| column.gsub(/\s\([0\+\-]([^\)]+)?\)/, '') }
          .map { |column| column.split(/[\s\(\)]/) }.flatten
          .reject { |column| column.empty? }
          .each { |column| notes << column if /[＊※]/ =~ column }
          .reject { |column| /[＊※]/.match(column) }
          .push(notes.empty? ? 'NA' : notes.join(' '))
      end

      # Transform prefecture numbers into ISO 3166-2 codes.
      rows.each { |row| row.first.replace(['JP-', row.first.rjust(2, '0')].join('')) }

      # Tranform number strings into numbers.
      rows.map! { |row| row.map { |column| /^[0-9]+$/ =~ column ? column.to_i : column } }

      # Validate the number of rows in the table.
      if row_count != rows.length
        raise(StandardError, "Counted #{rows.length} rows, expected #{row_count}")
      end

      # Validate the number of columns in each row.
      rows.each do |row|
        if header.length != row.length
          raise(StandardError, "Counted #{row.length} columns, expected #{header.length}")
        end
      end
    end

    TabulaWrapper = Struct.new(:path, :range) do
      include PageConstants

      def extract
        pages = Tabula::Extraction::ObjectExtractor.new(path, range).extract

        if pages.first.spreadsheets.empty?
          raise(StandardError, "#{path.split('/').last} has no extractable text")
        end

        caption = extract_caption(pages.first)

        rows = extract_table(pages)

        [caption, rows]
      end

      def horizontal_lines(page)
        page.spreadsheets.first.horizontal_ruling_lines
      end

      def extract_caption(page)
        # Offset the top of the caption area to exclude the page number.
        caption_area_top = 45

        # Set the bottom of the extractor to the top of the table.
        caption_area_bottom = horizontal_lines(page)[0].to_json({}).split(',').last.to_f

        # 1. Extract the caption text.
        # 2. Replace each element with its text value, a character.
        # 3. Delete empty elements (spaces).
        # 4. Join the character array into a string with no separator.
        page.get_text([caption_area_top, page_left, caption_area_bottom, page_right])
          .map { |element| element.text.strip }
          .reject { |element| element.empty? }
          .join('')
      end

      def extract_table(pages)
        rows = []

        # Extract the table rows from each extracted page.
        pages.each do |page|
          # Offset the top of the table to exclude the problematic
          # merged columns in the header row.
          table_area_top = horizontal_lines(page)[1].to_json({}).split(',').last.to_f
          rows.push(*page.get_area([table_area_top, page_left, page_bottom, page_right]).spreadsheets.first.to_a)
        end

        rows
      end
    end
  end
end
