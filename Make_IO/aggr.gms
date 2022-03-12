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

*       ディレクトリの区切り文字列
$setglobal fs %system.dirsep%

*       データの年
$if not setglobal year $setglobal year 2011

*       統合後の集合を定義したファイルの指定
$if not setglobal set_name $setglobal set_name japan_2011_26x18
$setglobal set_file .%fs%set%fs%%set_name%.set

*       CO2（3EID）データを利用するか？利用するなら非ゼロを設定
$if not setglobal fl_use_co2 $setglobal fl_use_co2 1

*       統合用のmapping集合を定義したファイルの指定
$setglobal map_file .%fs%set%fs%%set_name%.map

$if not setglobal output $setglobal output %set_name%
$setglobal output_file .%fs%aggr_data%fs%%output%
$setglobal check_file .%fs%data_check%fs%%output%

option decimals = 0;

display "set_file = %set_file%";
display "map_file = %map_file%";
display "output_file = %output_file%";

*       ----------------------------------------------------------------------
*       インデックスの import:
display "@ インデックスの import:";

$include .%fs%set%fs%basic_code_%year%.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_fd_imp,
        col_fd_, col_exp, col_imp, col_mar, col_ind;

*       ----------------------------------------------------------------------
*       統合前のデータの import
display "@ 統合前のデータの import";

$gdxin .%fs%data%fs%japan_io_%year%.gdx

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
    check_va_fd
    check_io
;
check_va_fd("va") = sum((va,col), io_va(va,col));
check_va_fd("fd") = sum((fd,row,so), io_fd(row,fd,so));
check_va_fd("fd-va") = round(check_va_fd("fd") - check_va_fd("va"), 6);
display check_va_fd;
abort$check_va_fd("fd-va") "VA and FD inconsistency!", check_va_fd;

check_io(col,"col_sum") = sum((row,so), io_u(row,col,so)) + sum(va, io_va(va,col));
check_io(col,"col_sum_") = sum(row, io_v(row,col));
check_io(col,"col_diff") = check_io(col,"col_sum") - check_io(col,"col_sum_");

check_io(row,"row_sum") = sum((col,so), io_u(row,col,so)) + sum((fd,so), io_fd(row,fd,so));
check_io(row,"row_sum_") = sum(col, io_v(row,col));
check_io(row,"row_diff") = check_io(row,"row_sum") - check_io(row,"row_sum_");
display check_io;

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
$if not %fl_use_co2%==0 $gdxin .%fs%data%fs%japan_io_%year%_co2.gdx
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

parameter    meta_data;
meta_data("行部門","value") = card(row);
meta_data("列部門","value") = card(col);
meta_data("付加価値部門","value") = card(va);
meta_data("最終需要部門","value") = card(fd);
display meta_data;

parameter check_io_co2;

check_io_co2(row,col) = io_co2(row,col);
check_io_co2(row,fd) = io_co2(row,fd);
check_io_co2("sum",col) = sum(row, io_co2(row,col));
check_io_co2("sum",fd) = sum(row, io_co2(row,fd));
check_io_co2(row,"sum")
    = sum(col, io_co2(row,col)) + sum(fd, io_co2(row,fd));
check_io_co2(row,"ind_sum") = sum(col, io_co2(row,col));
check_io_co2("sum","ind_sum") = sum((row,col), io_co2(row,col));
check_io_co2("sum","sum") =
    sum(row, sum(col, io_co2(row,col)) + sum(fd, io_co2(row,fd)));
display check_io_co2;

*       ------------------------------------------------------------

display "@ ";
*       ------------------------------------------------------------

parameter
    io_table     "連関表"
;
io_table(row,col) = sum(so, io_u(row,col,so)) + eps;
io_table(va,col) = io_va(va,col) + eps;
io_table(row,fd) = sum(so, io_fd(row,fd,so)) + eps;
io_table("Total",col) = sum(row, io_table(row,col)) + sum(va, io_table(va,col));
io_table(row,"Total") = sum(col, io_table(row,col)) + sum(fd, io_table(row,fd));

option io_table:0;
display io_table;


parameter
    chk_row             "IO table (tril.yen)"
    chk_col             "IO table (tril.yen)"
    chk_row_out         "Output - row (tril.yen)"
    chk_col_out         "Output - column (tril.yen)"
    chk_va_fd           "VA and FD (tril.yen)"
    chk_row_co2         "CO2 (MtCO2)"
    chk_col_co2         "CO2 (MtCO2)"
    chk_data            "Summary of data"
    chk_va              "VA (tril.yen)"
    chk_fd              "FD (tril.yen)"
    chk_co2_use         "CO2 by use (MtCO2)"
    chk_co2_so          "CO2 by source (MtCO2)"
    chk_trade           "Trade data (tril.yen)"
;
chk_row(row,"value") = sum(col, io_table(row,col)) + sum(fd, io_table(row,fd)) + eps;
chk_row(va,"value") = sum(col, io_table(va,col)) + sum(fd, io_table(va,fd)) + eps;
chk_row("Total","value") = sum(row, chk_row(row,"value")) + sum(va, chk_row(va,"value"));

chk_col("value",col) = sum(row, io_table(row,col)) + sum(va, io_table(va,col)) + eps;
chk_col("value",fd) = sum(row, io_table(row,fd)) + sum(va, io_table(va,fd)) + eps;
chk_col("value","Total") = sum(col, chk_col("value",col)) + sum(fd, chk_col("value",fd));

chk_row_out(row,"value") = chk_row(row,"value");
chk_row_out("Total","value") = sum(row, chk_row_out(row,"value"));
chk_col_out(col,"value") = chk_col("value",col);
chk_col_out("Total","value") = sum(col, chk_col_out(col,"value"));

chk_va_fd("va","value") = sum((va,col), io_table(va,col));
chk_va_fd("fd","value") = sum((row,fd), io_table(row,fd));

chk_row_co2(row,"value") = sum(col, io_co2(row,col)) + sum(fd, io_co2(row,fd)) + eps;
chk_row_co2(va,"value") = sum(col, io_co2(va,col)) + sum(fd, io_co2(va,fd)) + eps;
chk_row_co2("Total","value") = sum(row, chk_row_co2(row,"value")) + sum(va, chk_row_co2(va,"value"));

chk_col_co2("value",col) = sum(row, io_co2(row,col)) + sum(va, io_co2(va,col)) + eps;
chk_col_co2("value",fd) = sum(row, io_co2(row,fd)) + sum(va, io_co2(va,fd)) + eps;
chk_col_co2("value","Total") = sum(col, chk_col_co2("value",col)) + sum(fd, chk_col_co2("value",fd));

chk_data("col_sum","value") = round(chk_col("value","Total") / 1000, 1) + eps;
chk_data("row_sum","value") = round(chk_row("Total","value") / 1000, 1) + eps;
chk_data("fd_sum","value") = round(chk_va_fd("fd","value") / 1000, 1) + eps;
chk_data("va_sum","value") = round(chk_va_fd("va","value") / 1000, 1) + eps;
chk_data("col_co2_sum(MtCO2)","value") = round(chk_row_co2("Total","value"), 1) + eps;
chk_data("row_co2_sum(MtCO2)","value") = round(chk_col_co2("value","Total"), 1) + eps;

display chk_row, chk_col, chk_row_out, chk_col_out, chk_va_fd, chk_row_co2, chk_col_co2, chk_data;

chk_va(col,"value") = sum(va, io_table(va,col)) / 1000 + eps;
chk_va("Total","value") = round(sum(col, chk_va(col,"value")), 1);
chk_va(col,"sh(%)") = 100 * chk_va(col,"value") / chk_va("Total","value") + eps;

chk_fd(row,"value") = sum(fd, io_table(row,fd)) / 1000 + eps;
chk_fd("Total","value") = round(sum(row, chk_fd(row,"value")), 1);
chk_fd(row,"sh(%)") =
    100 * chk_fd(row,"value") / chk_fd("Total","value") + eps;

display chk_va, chk_fd;

set     fd_trade(fd) / expo, impo /;

chk_trade(row,fd_trade) = round(io_table(row,fd_trade) / 1000, 1) + eps;
chk_trade("Total",fd_trade) = sum(row, chk_trade(row,fd_trade));
chk_trade(row,"tb") = sum(fd$fd_trade(fd), chk_trade(row,fd)) + eps;
chk_trade("Total","tb") = sum(row, chk_trade(row,"tb"));
chk_trade(row,"tb_") = chk_trade(row,"expo") + chk_trade(row,"impo");
chk_trade("Total","tb_") = sum(row, chk_trade(row,"tb_"));

display chk_trade;

chk_co2_use(col,"value") = sum(row, io_co2(row,col)) + eps;
chk_co2_use(fd,"value") = sum(row, io_co2(row,fd)) + eps;
chk_co2_use("Total","value")
    = sum(col, chk_co2_use(col,"value")) + sum(fd, chk_co2_use(fd,"value"));
chk_co2_use(col,"sh_(%)")$(chk_co2_use("Total","value") > 1e-6)
    = 100 * chk_co2_use(col,"value") / chk_co2_use("Total","value") + eps;
chk_co2_use(fd,"sh_(%)")$(chk_co2_use("Total","value") > 1e-6)
    = 100 * chk_co2_use(fd,"value") / chk_co2_use("Total","value") + eps;
chk_co2_use("Total","sh_(%)") = sum(col, chk_co2_use(col,"sh_(%)")) + sum(fd, chk_co2_use(fd,"sh_(%)"));
display chk_co2_use;

chk_co2_so(row,"value")
    = round(sum(col, io_co2(row,col)) + sum(fd, io_co2(row,fd)), 1) + eps;
chk_co2_so("Total","value") = sum(row, chk_co2_so(row,"value"));
chk_co2_so(row,"sh_(%)")$(chk_co2_so("Total","value") > 1e-6)
    = round(100 * chk_co2_so(row,"value") / chk_co2_so("Total","value"), 1) + eps;
chk_co2_so("Total","sh_(%)") = sum(row, chk_co2_so(row,"sh_(%)"));
display chk_co2_so;


*       ----------------------------------------------------------------------
*       データの export
display "@ データの export";
$ontext
データを GDX ファイルにエクスポート．

$offtext

execute_unload '%output_file%.gdx', row, col, va, fd, set_vt, row_bas, io_u,
    io_v, io_fd, io_va, io_q, io_q_v, io_co2, io_table, meta_data, chk_data,
    chk_va, chk_fd, chk_col_out, chk_row_out, chk_co2_use, chk_co2_so, chk_trade


$onecho > temp.txt
i=%output_file%.gdx o=%check_file%.xlsx
epsout=0
*       Meta_data
text="%set_name%" rng=Meta_data!A1
text="部門数の値" rng=Meta_data!A3 par=meta_data rng=Meta_data!A4 rdim=1 cdim=1

*       Set_data
text="%set_name%" rng=Set_data!A1
text="row（行部門）" rng=Set_data!A3 set=row rng=Set_data!A4 rdim=1
text="col（列部門）" rng=Set_data!D3 set=col rng=Set_data!D4 rdim=1
text="va（付加価値部門）" rng=Set_data!G3 set=va rng=Set_data!G4 rdim=1
text="fd（最終需要部門）" rng=Set_data!J3 set=fd rng=Set_data!J4 rdim=1

*       Value_data
text="産業連関表（10億円）" rng=Value_data!A1 par=io_table rng=Value_data!A3 rdim=1 cdim=1

*       V_table_data
text="V表（10億円）財×部門" rng=V_table_data!A1 par=io_v rng=V_table_data!A3 rdim=1 cdim=1

*       Check_data
text="Data check for %set_name%" rng=Check_data!A1
text="Unit: value -> tril.yen, CO2 -> MtCO2" rng=Check_data!A3
text="Data summary" rng=Check_data!A4 par=chk_data rng=Check_data!A5 rdim=1 cdim=1

text="col（列部門）" rng=Check_data!D5 set=col rng=Check_data!D6 rdim=1
text="生産額" rng=Check_data!F4 par=chk_col_out rng=Check_data!F5 rdim=1 cdim=1

text="row（行部門）" rng=Check_data!I5 set=row rng=Check_data!I6 rdim=1
text="生産額" rng=Check_data!K4 par=chk_row_out rng=Check_data!K5 rdim=1 cdim=1

text="col（列部門）" rng=Check_data!N5 set=col rng=Check_data!N6 rdim=1
text="VA" rng=Check_data!P4 par=chk_va rng=Check_data!P5 rdim=1 cdim=1

text="row（行部門）" rng=Check_data!T5 set=row rng=Check_data!T6 rdim=1
text="FD" rng=Check_data!V4 par=chk_fd rng=Check_data!V5 rdim=1 cdim=1

text="row（行部門）" rng=Check_data!Z5 set=row rng=Check_data!Z6 rdim=1
text="Trade" rng=Check_data!AB4 par=chk_trade rng=Check_data!AB5 rdim=1 cdim=1

*       CO2_data
text="CO2排出量（MtCO2）" rng=CO2_data!A1 par=io_co2 rng=CO2_data!A3 rdim=1 cdim=1
*       Check_CO2
text="Data check for %set_name%" rng=Check_CO2!A1
text="Unit: value -> MtCO2" rng=Check_CO2!A3
text="CO2 (use)" rng=Check_CO2!A4 par=chk_co2_use rng=Check_CO2!A5 rdim=1 cdim=1
text="CO2 (source)" rng=Check_CO2!E4 par=chk_co2_so rng=Check_CO2!E5 rdim=1 cdim=1

*       物量用のインデックス    
text="row_bas" rng=Q_set!A3 set=row_bas rng=Q_set!A4 rdim=1

*       Check_Q
text="物量表" rng=Q_table!A1 par=io_q rng=Q_table!A3 rdim=1 cdim=1
*       Check_QV
text="物量に対応した投入額（10億円）" rng=QV_table!A1 par=io_q_v rng=QV_table!A3 rdim=1 cdim=1
$offecho

*       The following command evokes gdxxrw with the content of temp.txt as
*       arguments.
execute '=gdxxrw @temp.txt';

execute 'del temp.txt';



* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: sjis-dos
* End:
