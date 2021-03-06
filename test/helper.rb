# encoding: utf-8

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'evacuees/constants'
require 'evacuees/writers'
require 'evacuees/pdf_extractor'

Evacuees::Test = MiniTest::Test

class Evacuees::Test
  module TestPDFExtractorConstants
    def pdf_0_rows
      [["JP-01", "北海道", 0, 0, 1005, 1545, 105, "NA"], ["JP-02", "青森県", 0, 26, 786, 357, 34, "NA"], ["JP-03", "岩手県", 1144, 2032, 1716, "NA", 16, "NA"], ["JP-04", "宮城県", 8247, 2035, "NA", "NA", 21, "NA"], ["JP-05", "秋田県", 6, 485, 787, 379, 21, "NA"], ["JP-06", "山形県", 142, 744, 813, 6879, 35, "NA"], ["JP-07", "福島県", 1898, 11294, "NA", "NA", 35, "NA"], ["JP-08", "茨城県", 41, 128, 637, 1559, 39, "NA"], ["JP-09", "栃木県", 36, 332, 938, 1497, 26, "NA"], ["JP-10", "群馬県", 14, 385, 362, 1542, 31, "NA"], ["JP-11", "埼玉県", 943, 49, 0, 1661, 39, "NA"], ["JP-12", "千葉県", "NA", "NA", 3537, "NA", 47, "NA"], ["JP-13", "東京都", 97, 271, 2286, 4550, 50, "NA"], ["JP-14", "神奈川県", 54, 0, 0, 1409, 4, "＊"], ["JP-15", "新潟県", 230, 1685, 1514, 3915, 31, "＊"], ["JP-16", "富山県", 0, 0, 103, 396, 13, "NA"], ["JP-17", "石川県", 0, 11, 164, 394, 14, "NA"], ["JP-18", "福井県", 0, 11, 116, 376, 16, "NA"], ["JP-19", "山梨県", 0, 22, 366, 488, 22, "NA"], ["JP-20", "長野県", 51, 35, 285, 864, 52, "NA"], ["JP-21", "岐阜県", 0, 0, 179, 200, 30, "NA"], ["JP-22", "静岡県", 0, 307, 426, 748, 33, "NA"], ["JP-23", "愛知県", 0, 0, 244, 1013, 45, "NA"], ["JP-24", "三重県", 0, 0, 43, 156, 13, "NA"], ["JP-25", "滋賀県", 0, 0, 279, 144, 16, "NA"], ["JP-26", "京都府", 0, "NA", 48, 742, 13, "NA"], ["JP-27", "大阪府", "NA", "NA", "NA", 999, 24, "NA"], ["JP-28", "兵庫県", 0, 0, 416, 592, 26, "NA"], ["JP-29", "奈良県", 0, 0, 64, 75, 14, "NA"], ["JP-30", "和歌山県", 0, 0, 56, 45, 15, "NA"], ["JP-31", "鳥取県", 0, 0, 78, 69, 15, "NA"], ["JP-32", "島根県", 0, 0, 28, 140, 11, "NA"], ["JP-33", "岡山県", 0, 0, 174, 246, 18, "NA"], ["JP-34", "広島県", 0, 0, 145, 283, 14, "NA"], ["JP-35", "山口県", 0, 0, 103, 90, 13, "NA"], ["JP-36", "徳島県", 0, 0, 51, 72, 12, "NA"], ["JP-37", "香川県", 0, 0, 25, 56, 9, "NA"], ["JP-38", "愛媛県", 0, 0, 154, 108, 11, "NA"], ["JP-39", "高知県", 0, 0, 78, 57, 16, "NA"], ["JP-40", "福岡県", 0, 0, 194, 410, 36, "NA"], ["JP-41", "佐賀県", 0, 0, 81, 200, 12, "NA"], ["JP-42", "長崎県", 0, 0, 65, 104, 16, "NA"], ["JP-43", "熊本県", 0, 0, 104, 131, 25, "NA"], ["JP-44", "大分県", 0, 0, 147, 231, 16, "NA"], ["JP-45", "宮崎県", 0, 0, 76, 72, 10, "NA"], ["JP-46", "鹿児島県", 0, 0, 121, 126, 24, "NA"], ["JP-47", "沖縄県", 2, 66, 80, 446, 21, "NA"]]
    end

    def pdf_8_rows
      [["JP-01", "北海道", 0, 0, 924, 2106, 99, "NA"], ["JP-02", "青森県", 0, 1, 599, 522, 28, "NA"], ["JP-03", "岩手県", 0, 0, 885, 41587, 20, "※1"], ["JP-04", "宮城県", 31, 16, 191, 121991, 35, "※1"], ["JP-05", "秋田県", 0, 45, 727, 808, 20, "NA"], ["JP-06", "山形県", 12, 130, 663, 12711, 34, "NA"], ["JP-07", "福島県", 41, 92, "NA", 94210, 59, "※1"], ["JP-08", "茨城県", 16, 31, 634, 2342, 39, "NA"], ["JP-09", "栃木県", 0, 9, 948, 1740, 25, "NA"], ["JP-10", "群馬県", 0, 0, 309, 1724, 28, "NA"], ["JP-11", "埼玉県", 670, 6, 0, 4245, 56, "NA"], ["JP-12", "千葉県", 0, "NA", 3675, "NA", 46, "NA"], ["JP-13", "東京都", 7, 301, 2467, 6094, 55, "NA"], ["JP-14", "神奈川県", 0, 0, 0, 2087, 2, "※1"], ["JP-15", "新潟県", 0, 6, 472, 6504, 30, "※1"], ["JP-16", "富山県", 0, 0, 106, 331, 11, "NA"], ["JP-17", "石川県", 0, 1, 122, 417, 13, "NA"], ["JP-18", "福井県", 0, 20, 92, 377, 16, "NA"], ["JP-19", "山梨県", 0, 0, 295, 540, 21, "NA"], ["JP-20", "長野県", 0, 7, 215, 945, 48, "NA"], ["JP-21", "岐阜県", 0, 0, 191, 232, 29, "NA"], ["JP-22", "静岡県", 0, 16, 464, 968, 33, "NA"], ["JP-23", "愛知県", 0, 0, 250, 1002, 46, "NA"], ["JP-24", "三重県", 0, 0, 41, 148, 12, "NA"], ["JP-25", "滋賀県", 0, 0, 267, 136, 16, "NA"], ["JP-26", "京都府", 0, "NA", 238, 811, 18, "NA"], ["JP-27", "大阪府", 0, 0, 294, 1117, 33, "NA"], ["JP-28", "兵庫県", 0, 0, 413, 659, 28, "NA"], ["JP-29", "奈良県", 0, 0, 67, 89, 17, "NA"], ["JP-30", "和歌山県", 0, 0, 49, 70, 14, "NA"], ["JP-31", "鳥取県", 0, 0, 41, 131, 15, "NA"], ["JP-32", "島根県", 0, 0, 20, 125, 11, "NA"], ["JP-33", "岡山県", 0, 0, 151, 344, 18, "NA"], ["JP-34", "広島県", 0, 0, 171, 325, 13, "NA"], ["JP-35", "山口県", 0, 0, 100, 99, 13, "NA"], ["JP-36", "徳島県", 0, 0, 72, 89, 14, "NA"], ["JP-37", "香川県", 0, 0, 27, 63, 8, "NA"], ["JP-38", "愛媛県", 0, 0, 174, 92, 12, "NA"], ["JP-39", "高知県", 0, 0, 80, 54, 15, "NA"], ["JP-40", "福岡県", 0, 0, 220, 491, 37, "NA"], ["JP-41", "佐賀県", 0, 0, 68, 241, 11, "NA"], ["JP-42", "長崎県", 0, 0, 79, 108, 14, "NA"], ["JP-43", "熊本県", 0, 0, 100, 164, 26, "NA"], ["JP-44", "大分県", 0, 0, 111, 261, 16, "NA"], ["JP-45", "宮崎県", 0, 0, 97, 148, 13, "NA"], ["JP-46", "鹿児島県", 0, 0, 103, 165, 26, "NA"], ["JP-47", "沖縄県", 0, 29, 92, 699, 22, "NA"]]
    end

    def pdf_31_rows
      [["JP-01", "北海道", 0, 0, 532, 2285, 90, "NA"], ["JP-02", "青森県", 0, 0, 463, 408, 24, "NA"], ["JP-03", "岩手県", 0, 0, 332, 37914, 29, "※1"], ["JP-04", "宮城県", 0, 0, 1063, 98491, 35, "※1"], ["JP-05", "秋田県", 0, 0, 479, 685, 20, "NA"], ["JP-06", "山形県", 0, 0, 546, 8123, 33, "NA"], ["JP-07", "福島県", 0, 0, "NA", 92770, 47, "※1"], ["JP-08", "茨城県", 0, 0, 590, 4679, 42, "NA"], ["JP-09", "栃木県", 0, 0, 567, 2525, 25, "NA"], ["JP-10", "群馬県", 0, 0, 213, 1420, 27, "NA"], ["JP-11", "埼玉県", 107, 0, 0, 3296, 56, "NA"], ["JP-12", "千葉県", 0, "NA", 4030, "NA", 45, "NA"], ["JP-13", "東京都", 0, 0, 2218, 6633, 56, "NA"], ["JP-14", "神奈川県", 0, 0, 0, 2561, 24, "※1"], ["JP-15", "新潟県", 0, 0, 230, 4934, 28, "※1"], ["JP-16", "富山県", 0, 0, 66, 230, 10, "NA"], ["JP-17", "石川県", 0, 0, 65, 376, 11, "NA"], ["JP-18", "福井県", 0, 0, 49, 229, 14, "NA"], ["JP-19", "山梨県", 0, 0, 155, 645, 21, "NA"], ["JP-20", "長野県", 0, 0, 137, 1084, 44, "NA"], ["JP-21", "岐阜県", 0, 0, 121, 194, 27, "NA"], ["JP-22", "静岡県", 0, 0, 288, 799, 33, "NA"], ["JP-23", "愛知県", 0, 0, 193, 1047, 46, "NA"], ["JP-24", "三重県", 0, 0, 93, 403, 17, "NA"], ["JP-25", "滋賀県", 0, 0, 212, 118, 15, "NA"], ["JP-26", "京都府", 0, 0, 289, 693, 16, "NA"], ["JP-27", "大阪府", 0, 0, 297, 827, 31, "NA"], ["JP-28", "兵庫県", 0, 0, 280, 694, 27, "NA"], ["JP-29", "奈良県", 0, 0, 90, 83, 18, "NA"], ["JP-30", "和歌山県", 0, 0, 37, 66, 11, "NA"], ["JP-31", "鳥取県", 0, 0, 49, 145, 12, "NA"], ["JP-32", "島根県", 0, 0, 24, 107, 13, "NA"], ["JP-33", "岡山県", 0, 0, 313, 703, 19, "NA"], ["JP-34", "広島県", 0, 0, 201, 332, 15, "NA"], ["JP-35", "山口県", 0, 0, 48, 109, 14, "NA"], ["JP-36", "徳島県", 0, 0, 34, 39, 11, "NA"], ["JP-37", "香川県", 0, 0, 13, 84, 7, "NA"], ["JP-38", "愛媛県", 0, 0, 142, 49, 11, "NA"], ["JP-39", "高知県", 0, 0, 63, 64, 15, "NA"], ["JP-40", "福岡県", 0, 0, 143, 584, 38, "NA"], ["JP-41", "佐賀県", 0, 0, 25, 211, 9, "NA"], ["JP-42", "長崎県", 0, 0, 54, 94, 10, "NA"], ["JP-43", "熊本県", 0, 0, 107, 294, 20, "NA"], ["JP-44", "大分県", 0, 0, 46, 244, 15, "NA"], ["JP-45", "宮崎県", 0, 0, 90, 178, 11, "NA"], ["JP-46", "鹿児島県", 0, 0, 83, 162, 27, "NA"], ["JP-47", "沖縄県", 0, 0, 61, 933, 29, "NA"]]
    end

    def pdf_38_rows
      [["JP-01", "北海道", 2202, 515, 2, 89, "NA"], ["JP-02", "青森県", 354, 417, 14, 23, "NA"], ["JP-03", "岩手県", 34490, 352, 5, 29, "※1"], ["JP-04", "宮城県", 88781, 1096, 5, 35, "※1"], ["JP-05", "秋田県", 635, 453, 0, 20, "NA"], ["JP-06", "山形県", 5418, 567, 82, 32, "NA"], ["JP-07", "福島県", 85589, "NA", "NA", 47, "※1"], ["JP-08", "茨城県", 4241, 636, 42, 42, "NA"], ["JP-09", "栃木県", 2310, 611, 108, 25, "NA"], ["JP-10", "群馬県", 1175, 233, 128, 26, "NA"], ["JP-11", "埼玉県", 2925, 0, 0, 56, "NA"], ["JP-12", "千葉県", 565, 3396, 1, 45, "NA"], ["JP-13", "東京都", 6026, 1970, 34, 56, "NA"], ["JP-14", "神奈川県", 2362, 0, 0, 24, "※1"], ["JP-15", "新潟県", 4492, 204, 61, 28, "NA"], ["JP-16", "富山県", 218, 63, 3, 10, "NA"], ["JP-17", "石川県", 329, 66, 4, 11, "NA"], ["JP-18", "福井県", 223, 47, 0, 14, "NA"], ["JP-19", "山梨県", 615, 133, 0, 21, "NA"], ["JP-20", "長野県", 1006, 162, 0, 42, "NA"], ["JP-21", "岐阜県", 202, 110, 0, 25, "NA"], ["JP-22", "静岡県", 780, 299, 5, 30, "NA"], ["JP-23", "愛知県", 1031, 176, 0, 44, "NA"], ["JP-24", "三重県", 395, 95, 0, 15, "NA"], ["JP-25", "滋賀県", 101, 203, 0, 14, "NA"], ["JP-26", "京都府", 603, 321, 0, 16, "NA"], ["JP-27", "大阪府", 770, 185, 0, 30, "NA"], ["JP-28", "兵庫県", 647, 275, 0, 26, "NA"], ["JP-29", "奈良県", 77, 91, 0, 18, "NA"], ["JP-30", "和歌山県", 64, 37, 0, 12, "NA"], ["JP-31", "鳥取県", 131, 51, 0, 11, "NA"], ["JP-32", "島根県", 90, 28, 2, 13, "NA"], ["JP-33", "岡山県", 721, 325, 0, 19, "NA"], ["JP-34", "広島県", 274, 192, 1, 15, "NA"], ["JP-35", "山口県", 104, 44, 0, 12, "NA"], ["JP-36", "徳島県", 42, 31, 0, 12, "NA"], ["JP-37", "香川県", 81, 13, 0, 7, "NA"], ["JP-38", "愛媛県", 43, 139, 2, 11, "NA"], ["JP-39", "高知県", 57, 49, 0, 13, "NA"], ["JP-40", "福岡県", 564, 137, 0, 37, "NA"], ["JP-41", "佐賀県", 185, 24, 0, 9, "NA"], ["JP-42", "長崎県", 91, 52, 0, 10, "NA"], ["JP-43", "熊本県", 289, 107, 0, 20, "NA"], ["JP-44", "大分県", 209, 44, 1, 15, "NA"], ["JP-45", "宮崎県", 184, 72, 0, 11, "NA"], ["JP-46", "鹿児島県", 156, 77, 1, 25, "NA"], ["JP-47", "沖縄県", 917, 51, 5, 30, "NA"]]
    end
  end

  # Only extract each PDF once for testing.
  class << self
    attr_reader :pdf_0, :pdf_8, :pdf_31, :pdf_38

    def pdf_0
      @pdf_0 ||= Evacuees::PDFExtractor.new({:index => 0})
    end

    def pdf_8
      @pdf_8 ||= Evacuees::PDFExtractor.new({:index => 8})
    end

    def pdf_31
      @pdf_31 ||= Evacuees::PDFExtractor.new({:index => 31})
    end

    def pdf_38
      @pdf_38 ||= Evacuees::PDFExtractor.new({:index => 38})
    end
  end
end
