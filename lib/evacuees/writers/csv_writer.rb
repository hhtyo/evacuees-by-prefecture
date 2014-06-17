# encoding: utf-8

require 'csv'

module Evacuees
  module CSVWriter

    # Writes a header and extracted rows to a CSV file.
    # @param [Hash] opts the options to write the CSV with.
    # @option opts [String] :dir ('../../../data/csv') The target directory
    # @return [Array] The file metadata
    def to_csv(opts={})
      csv_dir = opts[:dir] || File.expand_path('../../../data/csv',  File.dirname(__FILE__))
      csv_name = ['evacuees-by-prefecture', date.to_s].join('-')
      csv_path = File.expand_path([csv_name, 'csv'].join('.'), csv_dir)
      csv_header = header.dup.push('年月日')

      CSV.open(csv_path, 'wb') do |csv|
        csv << csv_header

        rows.each do |row|
          csv_row = row.dup.push(date)

          csv << csv_row
        end
      end

      [csv_name, title, description, uri, csv_header]
    end
  end
end
