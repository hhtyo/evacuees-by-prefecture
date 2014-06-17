# encoding: utf-8

require 'json'

module Evacuees
  class DatapackageJSON

    # @attr_reader [Hash] datapackage
    attr_reader :datapackage

    # Creates a stub datapackage hash.
    def initialize
      @datapackage = {
        :name => 'evacuees-by-prefecture',
        :title => '所在都道府県別の避難者等の数',
        :keywords => ['Japan', 'earthquake', 'evacuees', 'refugees', 'prefecture'],
        :sources => [{
          :name => 'Reconstruction Agency',
          :web => 'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/hinanshasuu.html'
        }],
        :resources => []
      }
    end

    # Converts a datapackage hash to JSON.
    def to_json
      datapackage.to_json
    end

    # Adds a resource to a datapackage resources array.
    # @param [String] name
    # @param [String] title
    # @param [String] description
    # @param [String] uri
    # @param [Array] header
    def add_resource(name, title, description, uri, header)
      datapackage[:resources] << {
        :name => name,
        :title => title,
        :description => description,
        :path => ['data/csv/', name, '.csv'].join(''),
        :format => 'csv',
        :dialect => {:delimiter => ','},
        :mediatype => 'text/csv',
        :source => uri,
        :schema => {:fields => get_fields(header)}
      }
    end

    private

    def get_fields(header)
      last = header.length - 1

      fields = []

      (0..last).each do |index|
        fields << {
          :name => header[index],
          :description => '',
          :type => case index
                   when last then 'date'
                   when 2..(last - 2) then 'integer'
                   else 'string'
                   end
        }
      end

      fields
    end
  end
end
