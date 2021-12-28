$ontext

First-written:      <2020-12-04>

このファイルでは source_data フォルダの中の make_io.gms プログラムを実行しています。

gams .\source_data\make_io --year=XXXX

--year=XXXX の XXXX の部分は年の指定です。

$offtext

*       ディレクトリの区切り文字列
$setglobal fs %system.dirsep%
$ontext

上のように fs を定義すると、%fs% でディレクトリの区切文字列を表現できる。

$offtext

*       2015年のデータ
$call gams .%fs%source_data%fs%make_io.gms --year=2015

*       2011年のデータ
$call gams .%fs%source_data%fs%make_io.gms --year=2011

*       2005年のデータ
$call gams .%fs%source_data%fs%make_io.gms --year=2005



* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:





