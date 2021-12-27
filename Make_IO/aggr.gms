$ontext

First-written:  <2014/03/10>>

部門統合用のプログラム．

set: 統合後の集合を定義したファイルの指定
year: 年の指定（2015 or 2011 or 2005）

処理
・japan_io_%year%.gdx から金額データと物量データを読み込む．
・japan_io_%year%_co2.gdx からCO2データを読み込む．

・金額データの単位は100万円

CO2 のデータ（3EIDのデータ）を利用するのなら、fl_use_co2 に非ゼロを設定する。利
用しない場合は「io_co2」というパラメータにはゼロの値が代入される。

注
・物量データについては、列部門のみ統合し、行部門は統合しない。異なる財の物量を統
合しても無意味なため。

$offtext

* $setglobal year 2011
$setglobal set japan_2015_basic_std

*       CO2（3EID）データを利用する場合は非ゼロを設定
$setglobal fl_use_co2 1

*       データの年
$if not setglobal year $setglobal year 2015

*       統合後の集合を定義したファイルの指定
$if not setglobal set $setglobal set japan_2015_25x16
$setglobal set_file .\set\%set%.set

*       CO2（3EID）データを利用するか？利用するなら非ゼロを設定
$if not setglobal fl_use_co2 $setglobal fl_use_co2 0

*       統合用のmapping集合を定義したファイルの指定
$setglobal map_file .\set\%set%.map

$if not setglobal output $setglobal output %set%
$setglobal output_file .\aggr_data\%output%.gdx

option decimals = 0;

display "set_file = %set_file%";
display "map_file = %map_file%";
display "output_file = %output_file%";

*       ----------------------------------------------------------------------
*       インデックスの import:
display "@ インデックスの import:";

$include .\data\basic_code_%year%.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_fd_imp,
        col_fd_, col_exp, col_imp, col_mar, col_ind;

*       ----------------------------------------------------------------------
*       統合前のデータの import
display "@ 統合前のデータの import";

$gdxin .\data\japan_io_%year%.gdx

parameter
    iotable_u           "IO table %year% (U Table), mil. yen"
    iotable_v           "IO table %year% (V Table), mil. yen"
    iotable_fd          "IO table %year% (final demand), mil. yen"
    iotable_va          "IO table %year% (value added), mil. yen"
    iotable_q           "Quantity IO %year%"
    iotable_q_v         "Value talbe for quantity %year%, mil. yen"
;
$load iotable_u, iotable_v, iotable_va, iotable_fd, iotable_q, iotable_q_v

display iotable_u, iotable_v, iotable_fd, iotable_va, iotable_q, iotable_q_v;

*       ----------------------------------------------------------------------
*       統合用の集合の定義を import
display "@ 統合用の集合の定義を import";

$include %set_file%

display row, col, va, fd;

$include %map_file%

display row_map, col_map, va_map, fd_map;

*       以下は mapping set のチェック．
set     err_so(*)
        err_tg(*)
;
*       col_map:
err_so(col_ind) = yes$(sum(col, 1$col_map(col_ind,col)) - 1);
abort$card(err_so) "Element of source set col_ind not uniquely assigned:", err_so;

err_tg(col) = yes$(not sum(col_ind, 1$col_map(col_ind,col)));
abort$card(err_tg) "Element of target set col has no assignments", err_tg;

err_so(col_ind) = no;
err_tg(col) = no;

*       row_map:
err_so(row_ind) = yes$(sum(row, 1$row_map(row_ind,row)) - 1);
abort$card(err_so) "Element of source set row_ind not uniquely assigned:", err_so;

err_tg(row) = yes$(not sum(row_ind, 1$row_map(row_ind,row)));
abort$card(err_tg) "Element of target set row has no assignments", err_tg;

err_so(row_ind) = no;
err_tg(row) = no;

*       fd_map:
err_so(col_fd_imp) = yes$(sum(fd, 1$fd_map(col_fd_imp,fd)) - 1);
abort$card(err_so) "Element of source set col_fd_imp not uniquely assigned:", err_so;

err_tg(fd) = yes$(not sum(col_fd_imp, 1$fd_map(col_fd_imp,fd)));
abort$card(err_tg) "Element of target set fd has no assignments", err_tg;

err_so(col_fd_imp) = no;
err_tg(fd) = no;

*       va_map:
err_so(row_va) = yes$(sum(va, 1$va_map(row_va,va)) - 1);
abort$card(err_so) "Element of source set row_va not uniquely assigned:", err_so;

err_tg(va) = yes$(not sum(row_va, 1$va_map(row_va,va)));
abort$card(err_tg) "Element of target set va has no assignments", err_tg;

err_so(row_va) = no;
err_tg(va) = no;

*       ----------------------------------------------------------------------
*       データの統合:
display "@ データの統合";

set
    so          Source          / dom, imp, oth /
;
display so;

parameter
    sc_unit             単位変換用;
sc_unit = 1e-3;
display sc_unit;

$ontext
io_q: 物量表のデータを入れるパラメータ
i_q_v: これは投入量に対応する投入額を保持するパラメータ
$offtext
parameter
    io_u(*,*,*)         "Aggregated IO table (U table), bil yen"
    io_v(*,*)           "Aggregated IO table (V table), bil yen"
    io_fd(*,*,*)        "Aggregated IO table (final demand), bil yen"
    io_va(*,*)          "Aggregated IO table (value added), bil yen"
    io_q(*,*)           "Aggregated IO table (quantity)"
    io_q_v(*,*)         "Aggregated IO table (value for quantity), bil yen"
;
*       まず U table:
io_u(row,col,so)
    = sum(row_ind$row_map(row_ind,row),
        sum(col_ind$col_map(col_ind,col),
            iotable_u(row_ind,col_ind,so)));

io_u(row,col,so) = io_u(row,col,so) * sc_unit;


*       次、V table:
io_v(row,col)
    = sum(row_ind$row_map(row_ind,row),
        sum(col_ind$col_map(col_ind,col),
            iotable_v(row_ind,col_ind)));

io_v(row,col) = io_v(row,col) * sc_unit;

io_v("sum",col) = sum(row, io_v(row,col));
io_v(row,"sum") = sum(col, io_v(row,col));

*       付加価値部門
io_va(va,col)
    = sum(col_ind$col_map(col_ind,col),
        sum(row_va$va_map(row_va,va), iotable_va(row_va,col_ind)));

io_va(va,col) = io_va(va,col) * sc_unit;
io_va("sum",col) = sum(va, io_va(va,col));

*       最終需要部門
io_fd(row,fd,so)
    = sum(row_ind$row_map(row_ind,row),
        sum(col_fd_imp$fd_map(col_fd_imp,fd), iotable_fd(row_ind,col_fd_imp,so)));

io_fd(row,fd,so) = io_fd(row,fd,so) * sc_unit;


*       物量
$ontext
物量については列部門のみを統合。
$offtext
io_q(row_ind,col)
    = sum(col_ind$col_map(col_ind,col), iotable_q(row_ind,col_ind));
io_q(row_ind,fd)
    = sum(col_fd_imp$fd_map(col_fd_imp,fd), iotable_q(row_ind,col_fd_imp));

*       物量に対応する金額
$ontext
これも列部門のみを統合。
$offtext
io_q_v(row_ind,col)
    = sum(col_ind$col_map(col_ind,col), iotable_q_v(row_ind,col_ind));
io_q_v(row_ind,fd)
    = sum(col_fd_imp$fd_map(col_fd_imp,fd), iotable_q_v(row_ind,col_fd_imp));

io_q_v(row_ind,col) = io_q_v(row_ind,col) * sc_unit;
io_q_v(row_ind,fd) = io_q_v(row_ind,fd) * sc_unit;

display io_u, io_v, io_va, io_fd, io_q, io_q_v;

parameter
    chk_va_fd
    chk_io
;
chk_va_fd("va") = sum((va,col), io_va(va,col));
chk_va_fd("fd") = sum((fd,row,so), io_fd(row,fd,so));
chk_va_fd("fd-va") = round(chk_va_fd("fd") - chk_va_fd("va"), 6);
display chk_va_fd;
abort$chk_va_fd("fd-va") "VA and FD inconsistency!", chk_va_fd;

chk_io(col,"col_sum") = sum((row,so), io_u(row,col,so)) + sum(va, io_va(va,col));
chk_io(col,"col_sum_") = sum(row, io_v(row,col));
chk_io(col,"col_diff") = chk_io(col,"col_sum") - chk_io(col,"col_sum_");

chk_io(row,"row_sum") = sum((col,so), io_u(row,col,so)) + sum((fd,so), io_fd(row,fd,so));
chk_io(row,"row_sum_") = sum(col, io_v(row,col));
chk_io(row,"row_diff") = chk_io(row,"row_sum") - chk_io(row,"row_sum_");
display chk_io;

set set_vt;

set_vt(row,col) = no;
set_vt(row,col)$io_v(row,col) = yes;
display set_vt;

*       ----------------------------------------------------------------------
*       CO2排出量データの統合

parameter
    iotable_co2_data(*,*)    "CO2 emissions (MtCO2)";

*       CO2排出量データを使わない場合
$if %fl_use_co2%==0 iotable_co2_data(row_ind,col_ind) = 0;
$if %fl_use_co2%==0 iotable_co2_data(row_ind,col_fd) = 0;

*       CO2排出量データを使う場合
$if not %fl_use_co2%==0 $gdxin .\data\japan_io_%year%_co2.gdx
$if not %fl_use_co2%==0 $load iotable_co2_data

display iotable_co2_data;

parameter
    io_co2(*,*) "CO2 emissions (MtCO2)";

io_co2(row,col)
    = sum(row_ind$row_map(row_ind,row),
        sum(col_ind$col_map(col_ind,col),
            iotable_co2_data(row_ind,col_ind)));

io_co2(row,fd)
    = sum(row_ind$row_map(row_ind,row),
        sum(col_fd$fd_map(col_fd,fd),
            iotable_co2_data(row_ind,col_fd)));

io_co2("sum",col) = sum(row, io_co2(row,col));
io_co2("sum",fd) = sum(row, io_co2(row,fd));
io_co2(row,"sum") = sum(col, io_co2(row,col))
    + sum(fd, io_co2(row,fd));

option io_co2:3;
display io_co2;

parameter chk_io_co2;

chk_io_co2(row,col) = io_co2(row,col);
chk_io_co2(row,fd) = io_co2(row,fd);
chk_io_co2("sum",col) = sum(row, io_co2(row,col));
chk_io_co2("sum",fd) = sum(row, io_co2(row,fd));
chk_io_co2(row,"sum")
    = sum(col, io_co2(row,col)) + sum(fd, io_co2(row,fd));
chk_io_co2(row,"ind_sum") = sum(col, io_co2(row,col));
chk_io_co2("sum","ind_sum") = sum((row,col), io_co2(row,col));
chk_io_co2("sum","sum") =
    sum(row, sum(col, io_co2(row,col)) + sum(fd, io_co2(row,fd)));
display chk_io_co2;

*       ----------------------------------------------------------------------
*       データの export
display "@ データの export";
$ontext
iotable を GDX ファイルにエクスポート．

$offtext
execute_unload '%output_file%', row, col, va, fd, set_vt, io_u, io_v, io_fd,
    io_va, io_q, io_q_v, io_co2;


* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: sjis-dos
* End:
