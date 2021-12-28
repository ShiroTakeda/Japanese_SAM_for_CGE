$title 産業連関表と3EIDデータをGDXファイルに出力するためのプログラム

*       ディレクトリの区切り文字列
$setglobal fs %system.dirsep%
$ontext

上のように fs を定義すると、%fs% でディレクトリの区切文字列を表現できる。

$offtext

*       2015年のデータ
$call gams .%fs%source_data%fs%convert_io_table.gms --year=2015

*       2011年のデータ
$call gams .%fs%source_data%fs%convert_io_table.gms --year=2011

*       2005年のデータ
$call gams .%fs%source_data%fs%convert_io_table.gms --year=2005


* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:

