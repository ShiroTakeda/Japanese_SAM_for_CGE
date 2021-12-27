$title 統合されたデータをチェックするプログラム
display "@ 統合されたデータをチェックするプログラム";
$ontext
First-written:  <2014/03/10>

書式

     $setglobal set_name XXXX

XXXXの部分にデータの名前を指定する。

"data_check\check_XXXX.xlsx"というファイルにデータを出力する。

$offtext

*       データの指定

$setglobal set_name japan_2015_basic_std

*       ディレクトリの区切り文字列
$setglobal fs %system.dirsep%

$if not setglobal set_name $setglobal set_name japan_2015_37x37

$setglobal data_file .%fs%aggr_data%fs%%set_name%.gdx

$setglobal set_file .%fs%set%fs%%set_name%.set

$include %set_file%

display row, col, va, fd;

set     so      / dom, imp, oth /;

parameter
    io_u(*,*,*)         "Aggregated IO table (U table), bil yen"
    io_v(*,*)           "Aggregated IO table (V table), bil yen"
    io_fd(*,*,*)        "Aggregated IO table (final demand), bil yen"
    io_va(*,*)          "Aggregated IO table (value added), bil yen"
    io_co2(*,*)         "CO2 emissions (MtCO2)"
    io_q(*,*)           "Aggregated IO table (quantity)"
    io_q_v(*,*)         "Aggregated IO table (value for quantity), bil yen"
;

$gdxin '%data_file%'

$load io_u, io_v, io_fd, io_va, io_co2, io_q, io_q_v

display io_u, io_v, io_fd, io_va, io_q, io_q_v, io_co2;

parameter
    iotable     "連関表"
    iotable_v   "連関表（V表）"
;
iotable(row,col) = sum(so, io_u(row,col,so)) + eps;
iotable(va,col) = io_va(va,col) + eps;
iotable(row,fd) = sum(so, io_fd(row,fd,so)) + eps;
iotable("Total",col) = sum(row, iotable(row,col)) + sum(va, iotable(va,col));
iotable(row,"Total") = sum(col, iotable(row,col)) + sum(fd, iotable(row,fd));

iotable_v(row,col) = io_v(row,col) + eps;
iotable_v("Total",col) = sum(row, iotable_v(row,col));
iotable_v(row,"Total") = sum(col, iotable_v(row,col));

option iotable:0, iotable_v:0;
display iotable, iotable_v;

parameter
    iotable_co2 "連関表（CO2）"
;
iotable_co2(row,col) = io_co2(row,col) + eps;
iotable_co2(row,fd) = io_co2(row,fd) + eps;
display iotable_co2;

parameter    meta_data;
meta_data("行部門","value") = card(row);
meta_data("列部門","value") = card(col);
meta_data("付加価値部門","value") = card(va);
meta_data("最終需要部門","value") = card(fd);
display meta_data;

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
chk_row(row,"value") = sum(col, iotable(row,col)) + sum(fd, iotable(row,fd)) + eps;
chk_row(va,"value") = sum(col, iotable(va,col)) + sum(fd, iotable(va,fd)) + eps;
chk_row("Total","value") = sum(row, chk_row(row,"value")) + sum(va, chk_row(va,"value"));

chk_col("value",col) = sum(row, iotable(row,col)) + sum(va, iotable(va,col)) + eps;
chk_col("value",fd) = sum(row, iotable(row,fd)) + sum(va, iotable(va,fd)) + eps;
chk_col("value","Total") = sum(col, chk_col("value",col)) + sum(fd, chk_col("value",fd));

chk_row_out(row,"value") = chk_row(row,"value");
chk_row_out("Total","value") = sum(row, chk_row_out(row,"value"));
chk_col_out(col,"value") = chk_col("value",col);
chk_col_out("Total","value") = sum(col, chk_col_out(col,"value"));

chk_va_fd("va","value") = sum((va,col), iotable(va,col));
chk_va_fd("fd","value") = sum((row,fd), iotable(row,fd));

chk_row_co2(row,"value") = sum(col, iotable_co2(row,col)) + sum(fd, iotable_co2(row,fd)) + eps;
chk_row_co2(va,"value") = sum(col, iotable_co2(va,col)) + sum(fd, iotable_co2(va,fd)) + eps;
chk_row_co2("Total","value") = sum(row, chk_row_co2(row,"value")) + sum(va, chk_row_co2(va,"value"));

chk_col_co2("value",col) = sum(row, iotable_co2(row,col)) + sum(va, iotable_co2(va,col)) + eps;
chk_col_co2("value",fd) = sum(row, iotable_co2(row,fd)) + sum(va, iotable_co2(va,fd)) + eps;
chk_col_co2("value","Total") = sum(col, chk_col_co2("value",col)) + sum(fd, chk_col_co2("value",fd));

chk_data("col_sum","value") = round(chk_col("value","Total") / 1000, 1) + eps;
chk_data("row_sum","value") = round(chk_row("Total","value") / 1000, 1) + eps;
chk_data("fd_sum","value") = round(chk_va_fd("fd","value") / 1000, 1) + eps;
chk_data("va_sum","value") = round(chk_va_fd("va","value") / 1000, 1) + eps;
chk_data("col_co2_sum(MtCO2)","value") = round(chk_row_co2("Total","value"), 1) + eps;
chk_data("row_co2_sum(MtCO2)","value") = round(chk_col_co2("value","Total"), 1) + eps;

display chk_row, chk_col, chk_row_out, chk_col_out, chk_va_fd, chk_row_co2, chk_col_co2, chk_data;

chk_va(col,"value") = sum(va, iotable(va,col)) / 1000 + eps;
chk_va("Total","value") = round(sum(col, chk_va(col,"value")), 1);
chk_va(col,"sh(%)") = 100 * chk_va(col,"value") / chk_va("Total","value") + eps;

chk_fd(row,"value") = sum(fd, iotable(row,fd)) / 1000 + eps;
chk_fd("Total","value") = round(sum(row, chk_fd(row,"value")), 1);
chk_fd(row,"sh(%)") =
    100 * chk_fd(row,"value") / chk_fd("Total","value") + eps;

display chk_va, chk_fd;

set     fd_trade(fd) / expo, impo /;

chk_trade(row,fd_trade) = round(iotable(row,fd_trade) / 1000, 1) + eps;
chk_trade("Total",fd_trade) = sum(row, chk_trade(row,fd_trade));
chk_trade(row,"tb") = sum(fd$fd_trade(fd), chk_trade(row,fd)) + eps;
chk_trade("Total","tb") = sum(row, chk_trade(row,"tb"));
chk_trade(row,"tb_") = chk_trade(row,"expo") + chk_trade(row,"impo");
chk_trade("Total","tb_") = sum(row, chk_trade(row,"tb_"));

display chk_trade;

chk_co2_use(col,"value") = sum(row, iotable_co2(row,col)) + eps;
chk_co2_use(fd,"value") = sum(row, iotable_co2(row,fd)) + eps;
chk_co2_use("Total","value")
    = sum(col, chk_co2_use(col,"value")) + sum(fd, chk_co2_use(fd,"value"));
chk_co2_use(col,"sh_(%)")$(chk_co2_use("Total","value") > 1e-6)
    = 100 * chk_co2_use(col,"value") / chk_co2_use("Total","value") + eps;
chk_co2_use(fd,"sh_(%)")$(chk_co2_use("Total","value") > 1e-6)
    = 100 * chk_co2_use(fd,"value") / chk_co2_use("Total","value") + eps;
chk_co2_use("Total","sh_(%)") = sum(col, chk_co2_use(col,"sh_(%)")) + sum(fd, chk_co2_use(fd,"sh_(%)"));
display chk_co2_use;

chk_co2_so(row,"value")
    = round(sum(col, iotable_co2(row,col)) + sum(fd, iotable_co2(row,fd)), 1) + eps;
chk_co2_so("Total","value") = sum(row, chk_co2_so(row,"value"));
chk_co2_so(row,"sh_(%)")$(chk_co2_so("Total","value") > 1e-6)
    = round(100 * chk_co2_so(row,"value") / chk_co2_so("Total","value"), 1) + eps;
chk_co2_so("Total","sh_(%)") = sum(row, chk_co2_so(row,"sh_(%)"));
display chk_co2_so;

execute_unload "./data_check/check_%set_name%.gdx", row, col, va, fd, iotable,
    iotable_co2, iotable_v, io_q, io_q_v, meta_data, chk_data, chk_va, chk_fd,
    chk_col_out, chk_row_out, chk_co2_use, chk_co2_so, chk_trade;

$onecho > temp.txt
i=.%fs%data_check%fs%check_%set_name%.gdx o=.%fs%data_check%fs%check_%set_name%.xlsx
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
text="産業連関表（10億円）" rng=Value_data!A1 par=iotable rng=Value_data!A3 rdim=1 cdim=1

*       V_table_data
text="V表（10億円）財×部門" rng=V_table_data!A1 par=iotable_v rng=V_table_data!A3 rdim=1 cdim=1

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
text="CO2排出量（MtCO2）" rng=CO2_data!A1 par=iotable_co2 rng=CO2_data!A3 rdim=1 cdim=1
*       Check_CO2
text="Data check for %set_name%" rng=Check_CO2!A1
text="Unit: value -> MtCO2" rng=Check_CO2!A3
text="CO2 (use)" rng=Check_CO2!A4 par=chk_co2_use rng=Check_CO2!A5 rdim=1 cdim=1
text="CO2 (source)" rng=Check_CO2!E4 par=chk_co2_so rng=Check_CO2!E5 rdim=1 cdim=1

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

