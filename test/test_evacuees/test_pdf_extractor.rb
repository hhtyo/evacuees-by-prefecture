# encoding: utf-8

require 'helper'

class TestPDFExtractor < Evacuees::Test
  include TestPDFExtractorConstants
  include Evacuees::TableConstants

  def setup
    @pdf_0 = Evacuees::Test.pdf_0
    @pdf_8 = Evacuees::Test.pdf_8
    @pdf_31 = Evacuees::Test.pdf_31
    @pdf_38 = Evacuees::Test.pdf_38
  end

  def test_pdf_with_index_0_has_expected_path
    assert_equal File.expand_path('../../data/pdf/110803hinansya.pdf',  File.dirname(__FILE__)), @pdf_0.path
  end

  def test_pdf_with_index_0_has_expected_title
    assert_equal "所在都道府県別の避難者等の数（平成２３年７月２８日現在）", @pdf_0.title
  end

  def test_pdf_with_index_0_has_expected_description
    assert_equal "下段のカッコ書きは、前回（７月１４日現在）からの増減数", @pdf_0.description
  end

  def test_pdf_with_index_0_has_expected_date
    assert_equal Date.new(2011, 7, 28), @pdf_0.date
  end

  def test_pdf_with_index_0_has_expected_header
    assert_equal headers[0], @pdf_0.header
  end

  def test_pdf_with_index_0_has_expected_rows
    assert_equal pdf_0_rows, @pdf_0.rows
  end

  def test_pdf_with_index_8_has_expected_header
    assert_equal headers[0], @pdf_8.header
  end

  def test_pdf_with_index_8_has_expected_rows
    assert_equal pdf_8_rows, @pdf_8.rows
  end

  def test_pdf_with_index_31_has_expected_header
    assert_equal headers[0], @pdf_31.header
  end

  def test_pdf_with_index_31_has_expected_rows
    assert_equal pdf_31_rows, @pdf_31.rows
  end

  def test_pdf_with_index_38_has_expected_header
    assert_equal headers[1], @pdf_38.header
  end

  def test_pdf_with_index_38_has_expected_rows
    assert_equal pdf_38_rows, @pdf_38.rows
  end

  def test_scanned_pdf_returns_an_error
    assert_raises StandardError do
      Evacuees::PDFExtractor.new({:uri => 'http://www.reconstruction.go.jp/topics/120413hinansya.pdf'})
    end
  end
end
