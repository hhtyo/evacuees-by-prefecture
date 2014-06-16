# encoding: utf-8

require 'net/http'

module Evacuees
  class PDFDownloader
    include FileConstants

    attr_reader :uri, :path

    def initialize(opts={})
      @uri = opts[:uri] || files[opts[:index]]
      dir = opts[:dir] || File.expand_path('../../data/pdf',  File.dirname(__FILE__))
      @path = File.expand_path(uri.split('/').last, dir)
    end

    def get_pdf
      File.write(path, Net::HTTP.get(URI.parse(uri))) unless File.file?(path)
    end

    def get_pdf!
      File.write(path, Net::HTTP.get(URI.parse(uri)))
    end
  end
end
