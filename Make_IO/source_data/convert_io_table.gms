$title 産業連関表を excel から GDX ファイルに変換するプログラム
display "@ 産業連関表を excel から GDX ファイルに変換するプログラム";
$ontext
First-written:  <2015/12/09>

単位
・元の金額データは100万円．
・物量量はそれぞれの固有単位

$offtext

*       Year of the data = 2005, 2011 or 2015
$if not setglobal year $setglobal year 2015

$include ../data/basic_code_%year%.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_fd_imp,
        col_fd_, col_exp, col_imp, col_mar, col_ind;

set     item /
pro     "購入者価格"
pur     "生産者価格"
inc_pro "投入係数（生産者価格）"
inc_pur "投入係数（購入者価格）"
imp     "輸入"
m1      "卸"
m2      "小売"
m3      "鉄道"
m4      "道路"
m5      "沿海"
m6      "港湾"
m7      "航空"
m8      "利用運送"
m9      "倉庫"
/;

set     item_q /
q       "数量"
value   "金額"
/;

set     item_o /
pro     "購入者価格"
pur     "生産者価格"
drt_pro "需要比率（生産者価格）"
drt_pur "需要比率（購入者価格）"
imp     "輸入"
m1      "卸"
m2      "小売"
m3      "鉄道"
m4      "道路"
m5      "沿海"
m6      "港湾"
m7      "航空"
m8      "利用運送"
m9      "倉庫"
/;

set     sp /
1
2       "屑投入"
3       "屑発生"
4       "副産物投入"
5       "副産物発生"
6       "商業マージン"
7       "国内貨物運賃"
/;

parameter
    t_tonyu(*,*,*,item)         "投入表（100万円）"
    t_butsuryo(*,*,*,item_q)    "物量表"
    t_sanshutsu(*,*,*,item_o)   "産出表（V表、100万円）"
;

$onecho > temp.txt
i=io_basic_%year%.xlsx o=temp_io_%year%.gdx
par=t_tonyu rng=tonyu!A3:Q70000 rdim=3 cdim=1
par=t_butsuryo rng=butsuryo!A3:E10000 rdim=3 cdim=1
par=t_sanshutsu rng=sanshutsu!A3:Q70000 rdim=3 cdim=1
$offecho

* 以下の行は最初に実行するときのみ実行すればよい。
$call '=gdxxrw @temp.txt'

$gdxin temp_io_%year%.gdx

$load t_tonyu, t_butsuryo, t_sanshutsu

display t_tonyu, t_butsuryo, t_sanshutsu;

execute_unload "original_io_%year%.gdx", t_tonyu, t_butsuryo, t_sanshutsu, item, item_q, item_o, sp, row_bas, col_bas;

*       不要なファイルを削除
execute 'del temp.txt';
execute 'del temp_io_%year%.gdx';


* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:
