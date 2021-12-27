$title 全部を実行するプログラム
display "@ 全部を実行するプログラム";
$ontext
Time-stamp:     <2021-12-27 22:57:45 st>
First-written:  <2021-12-27>
$offtext

$call gams run_convert_io_table.gms
$call gams run_make_io.gms
$call gams run_make_3EID.gms
$call gams run_aggr.gms
$call gams run_check_aggr_data.gms





* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:
