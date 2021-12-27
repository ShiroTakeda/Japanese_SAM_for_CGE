$ontext

First-written:  <2014/03/10>>

+ 3eidデータを読み込む。
+ 部門や財の分類を普通の連関表のものに変換する。
+ 変換後のデータをexportする。

$offtext

$setglobal recreate 1

*       Set non-zero to recreate if you want to recreate GDX file from Excel file.
$if not setglobal recreate $setglobal recreate 0

*       ディレクトリの区切り文字列
$setglobal fs %system.dirsep%

$include .%fs%set%fs%basic_code_2005.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_imp,
        col_mar, col_ind;

set     so_n 3EIDにおける排出源 /
1       原料炭
2       一般炭・亜炭・無煙炭
3       コークス
4       高炉用コークス
5       コークス炉ガス（COG）
6       高炉ガス（BFG）消費
7       高炉ガス（BFG）発生
8       転炉ガス（LDG）消費
9       転炉ガス（LDG）発生
10      鉄含有炭素（転炉ガス起源分）
11      原油
12      A重油
13      B重油・C重油
14      灯油
15      軽油
16      揮発油
17      ジェット燃料油
18      ナフサ
19      石油系炭化水素ガス
20      炭化水素油
21      石油コークス
22      LPG
23      LNG・天然ガス
24      都市ガス
25      回収黒液
26      廃材
27      廃タイヤ
28      一般廃棄物
29      産業廃棄物
30      容器包装廃プラスチック
31      原子力発電
32      水力・その他発電
33      石灰石
/;
display so_n;

*       Parameters a and b must be declared beforehand.
parameter
    co2_temp(col_bas,so_n)
    co2_contrib_temp(col_bas,so_n)
;

$onecho > command.txt
i=.%fs%source_data%fs%3EID_2005.xlsx o=.%fs%source_data%fs%3EID_2005.gdx
par=co2_temp rng=CO2!D4:AK410 rdim=1 cdim=1
par=co2_contrib_temp rng=contribution!D4:AK410 rdim=1 cdim=1
$offecho
$if not %recreate%==0 $call '=gdxxrw @command.txt';

$gdxin .%fs%source_data%fs%3EID_2005.gdx

$load co2_temp co2_contrib_temp

display co2_temp, co2_contrib_temp;

set     so(row_bas) 連関表の分類による排出源 /
0711011        石炭
0711012        原油
0711013        天然ガス
2111011        ガソリン
2111012        ジェット燃料油
2111013        灯油
2111014        軽油
2111015        Ａ重油
2111016        Ｂ重油・Ｃ重油
2111017        ナフサ
2111018        液化石油ガス
2121011        コークス
2521011        石灰石
5121011        都市ガス
/;

set
    map_so(so,so_n)     /
0711011.(1,2)   石炭
0711012.11      原油
0711013.23      天然ガス
2111011.16      ガソリン
2111012.17      ジェット燃料油
2111013.14      灯油
2111014.15      軽油
2111015.12      Ａ重油
2111016.13      Ｂ重油・Ｃ重油
2111017.18      ナフサ
2111018.22      液化石油ガス
2121011.(3,4,5) コークス
2521011.33      石灰石
5121011.24      都市ガス
/;

display so, map_so;
$ontext
iotable_co2_contrib は 1 なら燃焼、 0 なら非燃焼用途ということ。
$offtext
parameter
    iotable_co2_data(so,*)      "CO2 emissions (MtCO2)"
    iotable_co2_contrib(so,*)   "CO2 emissions contribution flag (non-0 or 0)"
    co2_sf                      Scale factor
;
co2_sf = 1e-6;
display co2_sf;

iotable_co2_data(so,col_bas)
    = (sum(so_n$map_so(so,so_n), co2_temp(col_bas,so_n))) * co2_sf;

display iotable_co2_data;

iotable_co2_contrib(so,col_bas)
    = (sum(so_n$map_so(so,so_n), co2_contrib_temp(col_bas,so_n)));

option iotable_co2_contrib:0;
display iotable_co2_contrib;

*       ----------------------------------------------------------------------
*       データの export
display "@ データの export";
$ontext
iotable_end, iotable_fd, iotable_va の 3 つを japan-io2005.gdx に出力する．

$offtext
execute_unload '.%fs%data%fs%japan_io_2005_co2.gdx', iotable_co2_data, iotable_co2_contrib;

* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:
