$ontext

First-written:      <2020-12-04>

このファイルでは 3EID データを加工するプログラムを実行。

gams .\source_data\make_3eid_XXXX.gms

XXXX の部分は年の指定です。年毎に別のプログラムを実行する形になっています。

$offtext

*       ディレクトリの区切り文字列
$setglobal fs %system.dirsep%

*       2015年のデータ
$call gams .%fs%source_data%fs%make_3eid_2015.gms --year=2015

*       2011年のデータ
$call gams .%fs%source_data%fs%make_3eid_2011.gms --year=2011

*       2005年のデータ
$call gams .%fs%source_data%fs%make_3eid_2005.gms --year=2005



* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:






