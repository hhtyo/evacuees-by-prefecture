# encoding: utf-8

require 'csv'

module Evacuees
  module CSVWriter
    # @param [Hash] opts the options to write a CSV with.
    # @option opts [String] :dir
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

      # Return an array of variables for DatapackageJSON.
      [csv_name, title, description, uri, csv_header]
    end
  end
end
