# Evacuees by Prefecture

[![Build Status](https://travis-ci.org/hhtyo/evacuees-by-prefecture.png)](https://travis-ci.org/hhtyo/evacuees-by-prefecture) *The build fails without `tabula-extractor` commit [eb9b506](https://github.com/jazzido/tabula-extractor/commit/eb9b506e45cf916e61dd0404b91f612a49ea01be).*

## The Data

Japan's [Reconstruction Agency](http://www.reconstruction.go.jp/) compiles data on [Great East Japan Earthquake evacuees](http://www.reconstruction.go.jp/topics/main-cat2/sub-cat2-1/hinanshasuu.html) and publishes the data as [PDF files](https://github.com/hhtyo/evacuees-by-prefecture/tree/master/data/pdf).

### Extracted

[`tabula-extractor`](https://github.com/jazzido/tabula-extractor), an [Apache PDFBox](http://pdfbox.apache.org/)-powered, [JRuby](http://jruby.org/)  "table extraction engine", was used to extract the title, description, date, and evacuees by prefecture from pages three to five of each file.

### Transformed

Row and column totals and calculated changes in evacuee numbers were deleted. The first column, which had prefecture IDs and names, is split into two columns: [ISO 3166-2:JP](http://en.wikipedia.org/wiki/ISO_3166-2:JP) codes and prefecture names. Any notes that were in a table cell are in a new column at the end of the same row. Lastly, the data date is appended to the end of the each row. Missing or empty values are marked with 'NA'.

### Published

The extracted evacuees by prefecture tables are in the [CSV files](https://github.com/hhtyo/evacuees-by-prefecture/tree/master/data/csv) in this repository's `data/csv/` directory. Metadata for all the files are in a [data package](http://dataprotocols.org/data-packages/) in this directory named [datapackage.json](https://raw.githubusercontent.com/hhtyo/evacuees-by-prefecture/master/datapackage.json).

### Visualized

The inspiration for extracting this data came from a comment and a [visualization](http://www3.nhk.or.jp/nhkworld/newsline/path_to_recovery/post-disaster_recovery_in_numbers.pdf) shared by [NHK News Web](http://www3.nhk.or.jp/news/) developer Satoshi Yamamoto in the [European Journalism Centre](http://ejc.net/)'s [Doing Journalism with Data](http://datajournalismcourse.net/) MOOC. It would be exciting to see more stories told with this data.

[![CC0](http://i.creativecommons.org/p/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/)
