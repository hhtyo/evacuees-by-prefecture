# encoding: utf-8

require 'helper'

class TestPDFWriter < Evacuees::Test
  def setup
    pdf_0 = Evacuees::Test.pdf_0
    dir = File.expand_path('../../test_data/csv',  File.dirname(__FILE__))
    @csv_path = File.expand_path("evacuees-by-prefecture-#{pdf_0.date}.csv", dir)
    pdf_0.to_csv({:dir => dir})
  end

  def teardown
    File.delete(@csv_path)
  end

  def test_csv_file_is_written
    assert_equal true, File.file?(@csv_path)
  end
end
