# encoding: utf-8

module Evacuees
  module FileConstants

    # TITLE: Do we need constants?
    # AUTHOR: Avdi Grimm
    # DATE: August 18, 2011
    # URI: http://devblog.avdi.org/2011/08/18/do-we-need-constants/

    def files
      [
        'http://www.reconstruction.go.jp/topics/110803hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/110822hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/110831hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/hinansya0914.pdf',
        # hinansyo-mikomi.pdf is not a monthly report.
        # 'http://www.reconstruction.go.jp/topics/hinansyo-mikomi.pdf',
        'http://www.reconstruction.go.jp/topics/hinansya-suikei0928.pdf',
        'http://www.reconstruction.go.jp/topics/20111012hinansya1.pdf',
        'http://www.reconstruction.go.jp/topics/hinansyasu.pdf',
        'http://www.reconstruction.go.jp/topics/20111109hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/20111124hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/20111207hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/20111221hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/20120118hinannsyasu.pdf',
        'http://www.reconstruction.go.jp/topics/20120201zenkoku-hinansyasu.pdf',
        'http://www.reconstruction.go.jp/topics/20120215zenkoku-hinansyasu.pdf',
        'http://www.reconstruction.go.jp/topics/20120229zenkoku-hinansyasu.pdf',
        # 120413hinansya.pdf has no extractable text; the pages are images.
        # The file ./data/csv/evacuees-by-prefecture-2012-03-08.csv
        # is a hand transcription of the PDF.
        # 'http://www.reconstruction.go.jp/topics/120413hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/120328hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/120411hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/120516hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/120613hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/120711hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/120808hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/120912_hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/10101300_hpkouhyousyuusei.pdf',
        'http://www.reconstruction.go.jp/topics/20121107_hinansyasuusyuuseiban-2.pdf',
        'http://www.reconstruction.go.jp/topics/20121212_hinansyasuutyousa.pdf',
        'http://www.reconstruction.go.jp/topics/20130125_hinansyasuutyousa.pdf',
        'http://www.reconstruction.go.jp/topics/20130215_hinansya.pdf',
        'http://www.reconstruction.go.jp/topics/20130315_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/20130412_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/20130520_hinansha.pdf',
        'http://www.reconstruction.go.jp/content/20130618_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20130730_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20130822_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20130925_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20131025_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20131127_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20131224_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20140128_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20140226_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20140327_hinansha.pdf',
        # 20140328_hinansha_suii.pdf is not a monthly report.
        # 'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20140328_hinansha_suii.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20140425_hinansha.pdf',
        'http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/20140523_hinansha.pdf'
      ]
    end

    module_function :files
  end

  module PageConstants
    def page_top() 0 end
    def page_left() 0 end
    def page_bottom() 842 end # A4 height
    def page_right() 595 end # A4 width

    module_function :page_top, :page_left, :page_bottom, :page_right
  end

  module TableConstants
    def row_count() 47 end

    def title_re() /(所在都道府県別の避難者等の数（平成.{2}年.{1,2}月.{1,2}日現在）)/ end
    def description_re() /下段の.*増減数/ end
    def date_re() /.{2}年.{1,2}月.{1,2}/ end

    def headers
      [
        ["ISO 3166-2コード", "所在都道府県", "避難所（公民館、学校等）", "旅館・ホテル", "その他（親族・知人宅等）", "住宅等（公営、仮設、民間、病院含む）", "所在判明市区町村数", "注釈"],
        ["ISO 3166-2コード", "所在都道府県", "住宅等市区町村数（公営、応急仮設、民間賃貸等）", "親族・知人宅等", "病院等", "所在判明市区町村数", "注釈"]
      ]
    end

    module_function :row_count, :headers, :title_re, :description_re, :date_re
  end
end
