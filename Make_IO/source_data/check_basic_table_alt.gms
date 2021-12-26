$ontext

First-written:  <2014/03/10>>

統合前の基本取引表をチェックするプログラム

$offtext

$setglobal year 2011

*       データの年
$if not setglobal year $setglobal year 2015

$setglobal output_file check_basic_table_%year%

option decimals = 0;

display "output_file = %output_file%";

*       ----------------------------------------------------------------------
*       インデックスの import:
display "@ インデックスの import:";

$include ..\data\basic_code_%year%.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_fd_imp,
        col_fd_, col_exp, col_imp, col_mar, col_ind;

*       ----------------------------------------------------------------------
*       統合前のデータの import
display "@ 統合前のデータの import";

$gdxin ..\data\japan_io_%year%.gdx

parameter
    iotable_u   "IO table - %year% (U table)"
    iotable_v   "IO table - %year% (V table)"
    iotable_fd  "IO table - %year% (final demand)"
    iotable_va  "IO table - %year% (value added)"
    iotable_q   "IO table - %year% (quantity)"
    iotable_q_v "IO table - %year% (value data for quantity)"
;
$load iotable_u, iotable_v, iotable_va, iotable_fd, iotable_q, iotable_q_v

display iotable_u, iotable_v, iotable_fd, iotable_va, iotable_q, iotable_q_v;

parameter
    iotable_co2_data(*,*)    "CO2 emissions (MtCO2)";

*       CO2排出量データ
$gdxin ..\data\japan_io_%year%_co2.gdx

$load iotable_co2_data

display iotable_co2_data;


*       ----------------------------------------------------------------------
*       データのチェック
display "@ データのチェック";

parameter
    chk_io      "IO table - %year%"
    chk_io_q    "IO table - %year% (quantity)"
    chk_io_q_v  "IO table - %year% (value data for quantity)"
    chk_io_co2  "CO2 emissions (MtCO2)"
;
set so / dom, imp, oth /;

chk_io(row_ind,col_ind) = sum(so, iotable_u(row_ind,col_ind,so));
chk_io(row_va,col_ind) = iotable_va(row_va,col_ind);
chk_io(row_ind,col_fd_imp) = sum(so, iotable_fd(row_ind,col_fd_imp,so));
display chk_io;

chk_io_q(row_ind,col_ind) = iotable_q(row_ind,col_ind);
chk_io_q(row_ind,col_fd_imp) = iotable_q(row_ind,col_fd_imp);
display chk_io_q;

chk_io_q_v(row_ind,col_ind) = iotable_q_v(row_ind,col_ind);
chk_io_q_v(row_ind,col_fd_imp) = iotable_q_v(row_ind,col_fd_imp);
display chk_io_q_v;

chk_io_co2(row_ind,col_ind)
    = iotable_co2_data(row_ind,col_ind);
chk_io_co2(row_ind,col_fd_imp)
    = iotable_co2_data(row_ind,col_fd_imp);

parameter
    chk_unit_price      単価
;

chk_unit_price(row_ind,col_ind)$chk_io_q(row_ind,col_ind)
    = 1000 * chk_io_q_v(row_ind,col_ind) / chk_io_q(row_ind,col_ind);
chk_unit_price(row_ind,col_fd_imp)$chk_io_q(row_ind,col_fd_imp)
    = 1000 * chk_io_q_v(row_ind,col_fd_imp) / chk_io_q(row_ind,col_fd_imp);
display chk_unit_price;

*       ----------------------------------------------------------------------
*       データの export
display "@ データの export";
$ontext
iotable を GDX ファイルにエクスポート．

$offtext
display chk_io, chk_io_q, chk_io_q_v, chk_io_co2;

execute_unload '%output_file%', chk_io, chk_io_q, chk_io_q_v, chk_io_co2;

$onecho > temp.txt
i=./%output_file%.gdx o=./%output_file%.xlsx
epsout=0
text="産業連関表（10億円）" rng=Value_data!A1 par=chk_io rng=Value_data!A3 rdim=1 cdim=1
text="物量表" rng=Q_data!A1 par=chk_io_q rng=Q_data!A3 rdim=1 cdim=1
text="物量に対応した投入額（10億円）" rng=QV_data!A1 par=chk_io_q_v rng=QV_data!A3 rdim=1 cdim=1
$offecho

*       The following command evokes gdxxrw with the content of temp.txt as
*       arguments.
execute '=gdxxrw @temp.txt';

execute 'del temp.txt';




* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:
