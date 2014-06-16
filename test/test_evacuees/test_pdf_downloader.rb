# encoding: utf-8

require 'helper'
require 'evacuees/pdf_downloader'

class TestPDFDownloader < Evacuees::Test
  include Evacuees::FileConstants

  def setup
    dir = File.expand_path('../../test_data/pdf',  File.dirname(__FILE__))
    @pdf = Evacuees::PDFDownloader.new({:index => rand(0...files.length), :dir => dir})
    @pdf.get_pdf
  end

  def teardown
    File.delete(@pdf.path)
  end

  def test_pdf_file_is_downloaded
    assert_equal true, File.file?(@pdf.path)
  end
end
