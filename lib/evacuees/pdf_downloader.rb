# encoding: utf-8

require 'net/http'

module Evacuees
  class PDFDownloader
    include FileConstants

    # @attr_reader [String] uri
    # @attr_reader [String] path
    attr_reader :uri, :path

    # Sets the PDF's source uri and its target directory.
    # @param [Hash] opts
    # @option opts [Fixnum] :index
    # @option opts [String] :uri
    def initialize(opts={})
      @uri = opts[:uri] || files[opts[:index]]
      dir = opts[:dir] || File.expand_path('../../data/pdf',  File.dirname(__FILE__))
      @path = File.expand_path(uri.split('/').last, dir)
    end

    # Downloads a PDF unless the PDF exists.
    def get_pdf
      File.write(path, Net::HTTP.get(URI.parse(uri))) unless File.file?(path)
    end

    # Downloads a PDF, overwriting the PDF if it exists.
    def get_pdf!
      File.write(path, Net::HTTP.get(URI.parse(uri)))
    end
  end
end
