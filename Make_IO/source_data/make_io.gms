$ontext

First-written:  <2014/03/10>>

・orginal_io_XXXX.gdx がオリジナルの IO データ．

処理
・XXXX はデータの年: XXXX = 2005, 2011 or 2015
・元の連関表データ (orginal_io_XXXX.gdx) を読み込む．
・元々のデータでは「特殊コード」で分かれているが、それを合わせてしまう。
 ・加工したデータを japan_io_XXXX.gdx に出力する．

【注】
・部門の統合はおこなわない．

$offtext

* $setglobal year 2011

*       Year of the data = 2005, 2011 or 2015
$if not setglobal year $setglobal year 2015

$setglobal fs %system.dirsep% 

*       ----------------------------------------------------------------------
*       産業連関表の基本分類データを読み込む
$include .%fs%set%fs%basic_code_%year%.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_fd_imp,
        col_fd_, col_exp, col_imp, col_mar, col_ind;

alias (col_ind,col_), (row_ind,row_);

$include .%fs%set%fs%map_for_vtable_%year%.gms
display map_v;

$ontext
□ データの説明．

orginal_io_%year%.gdx が連関表の基本分類表．

パラメータ a にデータが含まれている．

* パラメータ a(row,col,特殊コード,項目) 基本分類の投入表．

- row は 7 桁
- col は 6 桁

- 特殊コード
・1~7 の数値
・1: 標準
・2: 屑 (投入)
・3: 屑 (発生)
・4: 副産物 (投入)
・5: 副産物 (発生)
・6: 商業マージン
・7: 国内貨物運賃

- 項目
・pro: 生産者価格
・pur: 購入者価格
・imp: 輸入
・m1~m9: 商業マージン、国内貨物運賃
・inc_pro: 投入係数（生産者価格）
・inc_pur: 投入係数（購入者価格）

$offtext

set     sp      "Special codes (特殊コード)"
        item    "Items (投入表用)"
        item_q  "Items (物量表用)"
        item_o  "Items (産出表用)"
    ;
$gdxin .%fs%source_data%fs%original_io_%year%.gdx

$load sp, item, item_q, item_o
display sp, item, item_q, item_o;

parameter
    t_tonyu(*,*,*,item)         "投入表（100万円）"
    t_butsuryo(*,*,*,item_q)    "物量表"
    t_sanshutsu(*,*,*,item_o)   "産出表（V表、100万円）"
;
$load t_tonyu, t_butsuryo, t_sanshutsu

display t_tonyu, t_butsuryo, t_sanshutsu;

$ontext
処理内容．

・特殊コードは統合してしまう．
・中間投入，最終需要の各項目を「国内財」，「輸入財」に分割する．

$offtext

set
    so          供給元  / dom, imp, oth /
;

parameter
    temp_io(row_bas,col_bas)            Basic table
    temp_im(row_bas,col_bas)            Import table
    temp_io_q(row_bas,col_bas)          Quantity table
    temp_io_q_v(row_bas,col_bas)        Value for quantity table
;

*       特殊コードを統合したデータを temp_io に代入．
temp_io(row_bas,col_bas) = sum(sp, t_tonyu(col_bas,row_bas,sp,"pro"));
display temp_io;

*       同様に特殊コードを統合した輸入データを temp_im に代入．
temp_im(row_bas,col_bas) = sum(sp, t_tonyu(col_bas,row_bas,sp,"imp"));
display temp_im;

*       特殊コードを統合した物量データを temp_io_q に代入．
temp_io_q(row_bas,col_bas) = sum(sp, t_butsuryo(row_bas,col_bas,sp,"q"));
display temp_io_q;

*       特殊コードを統合した物量データを temp_io_q に代入．
temp_io_q_v(row_bas,col_bas) = sum(sp, t_butsuryo(row_bas,col_bas,sp,"value"));
display temp_io_q_v;

parameter
    s_c(*,*)
    s_r(*,*)
    v_temp;
$ontext
s_r: 一部門・多数財生産の場合の各財のシェア

s_c: 多部門・一財生産の場合の各部門のシェア

$offtext

loop(col_ind,
    v_temp = 0;
    loop(row_ind$map_v(col_ind,row_ind),
        v_temp = v_temp + temp_io(row_ind,"970000");
    );
    loop(row_ind$map_v(col_ind,row_ind),
        s_r(row_ind,col_ind)$v_temp = temp_io(row_ind,"970000") / v_temp;
    );
);

loop(row_ind,
    v_temp = 0;
    loop(col_ind$map_v(col_ind,row_ind),
        v_temp = v_temp + temp_io("9700000",col_ind);
    );
    loop(col_ind$map_v(col_ind,row_ind),
        s_c(row_ind,col_ind)$v_temp = temp_io("9700000",col_ind) / v_temp;
    );
);
display s_r, s_c;

parameters
    chk_s_r, chk_s_c;

chk_s_r(col_ind) = sum(row_ind$map_v(col_ind,row_ind), s_r(row_ind,col_ind));
chk_s_r(col_ind) = chk_s_r(col_ind) - 1;
display chk_s_r;

chk_s_c(row_ind) = sum(col_ind$map_v(col_ind,row_ind), s_c(row_ind,col_ind));
chk_s_c(row_ind) = chk_s_c(row_ind) - 1;
display chk_s_c;

*       ----------------------------------------------------------------------
*       加工後のデータを入れるパラメータ．
$ontext

iotable_q_v は iotable_q に対応した金額データ。iotable_q に物量の投入が記録され
ているが、その投入量に対応する投入額が iotable_q_v に記録されている。iotable_q_v
を iotable_q で割ることで単価がわかる。

$offtext
parameter
    iotable_u           "IO table %year% (U Table), mil. yen"
    iotable_v           "IO table %year% (V Table), mil. yen"
    iotable_fd          "IO table %year% (final demand), mil. yen"
    iotable_va          "IO table %year% (value added), mil. yen"
    iotable_q           "Quantity IO %year%"
    iotable_q_v         "Value talbe for quantity %year%, mil. yen"
    chk_u               "This must be zero"
    chk_v               "This must be zero"
    chk_fd              "This must be zero"
    chk_va              "This must be zero"
    chk_fd_va           "This must be zero"
    chk_out
;
option iotable_u:0, iotable_v:0, iotable_fd:0, iotable_va:0;

*       U表 (中間投入)： 国内財，輸入財で区別しておく．
$ontext
dom: 国内財
imp: 輸入財
oth: 区別なし，あるいはどちらか片方．
$offtext
iotable_u(row_ind,col_ind,"dom") = temp_io(row_ind,col_ind) - temp_im(row_ind,col_ind);
iotable_u(row_ind,col_ind,"imp") = temp_im(row_ind,col_ind);
iotable_u("row_sum",col_ind,so) = sum(row_ind, iotable_u(row_ind,col_ind,so));
iotable_u(row_ind,"col_sum",so) = sum(col_ind, iotable_u(row_ind,col_ind,so));
display iotable_u;

parameter
    chk_sign;

chk_sign(row_ind,col_ind,so)$(iotable_u(row_ind,col_ind,so) <0)
    = iotable_u(row_ind,col_ind,so);
display chk_sign;

* iotable_u(row_ind,col_ind,so)$chk_sign(row_ind,col_ind,so) = 0;
* display iotable_u;

*       最終需要：
$ontext
輸入財，国内財で区別．
データは iotable_fd に代入．
$offtext
iotable_fd(row_ind,col_fd_,"dom") = temp_io(row_ind,col_fd_) - temp_im(row_ind,col_fd_);
iotable_fd(row_ind,col_fd_,"imp") = temp_im(row_ind,col_fd_);

iotable_fd(row_ind,col_exp,"oth") = temp_io(row_ind,col_exp);
iotable_fd(row_ind,col_imp,"oth") = temp_io(row_ind,col_imp);
display iotable_fd;

*       付加価値
$ontext
データは iotable_va に代入．
$offtext
iotable_va(row_va,col_ind) = temp_io(row_va,col_ind);
display iotable_va;

*       V表 (中間投入)
iotable_v(row_ind,col_ind) = 0;
iotable_v(row_ind,col_ind)$map_v(col_ind,row_ind)
    = (sum(col_, iotable_u(row_ind,col_,"dom"))
        + sum(col_fd, iotable_fd(row_ind,col_fd,"dom"))
        + sum(col_fd, iotable_fd(row_ind,col_fd,"oth"))
    ) * s_c(row_ind,col_ind);
display iotable_v;

parameters
    chk_iotable_v       "iotable_vと同じ値になるはず"
    chk_iotable_v_diff
;

chk_iotable_v(row_ind,col_ind) = 0;
chk_iotable_v(row_ind,col_ind)$map_v(col_ind,row_ind)
    = (sum((row_,so), iotable_u(row_,col_ind,so))
        + sum(row_va, iotable_va(row_va,col_ind))
    ) * s_r(row_ind,col_ind);
option chk_iotable_v:0;
display chk_iotable_v;

chk_iotable_v_diff(row_ind,col_ind) =
    round(iotable_v(row_ind,col_ind) - chk_iotable_v(row_ind,col_ind), 6);
display chk_iotable_v_diff;

*       物量表
iotable_q(row_ind,col_ind) = 0;
iotable_q(row_ind,col_fd) = 0;
iotable_q(row_ind,col_ind) = temp_io_q(row_ind,col_ind);
iotable_q(row_ind,col_fd_imp) = temp_io_q(row_ind,col_fd_imp);
display iotable_q;

iotable_q_v(row_ind,col_ind) = 0;
iotable_q_v(row_ind,col_fd) = 0;
iotable_q_v(row_ind,col_ind) = temp_io_q_v(row_ind,col_ind);
iotable_q_v(row_ind,col_fd_imp) = temp_io_q_v(row_ind,col_fd_imp);
display iotable_q_v;

*       以下はデータのチェック．
$if %year%==2005 chk_u("row",col_ind) = temp_io("9099000",col_ind) - sum(so, iotable_u("row_sum",col_ind,so));
$if %year%==2005 chk_u(row_ind,"col") = temp_io(row_ind,"909900") - sum(so, iotable_u(row_ind,"col_sum",so));
$if not %year%==2005 chk_u("row",col_ind) = temp_io("7000000",col_ind) - sum(so, iotable_u("row_sum",col_ind,so));
$if not %year%==2005 chk_u(row_ind,"col") = temp_io(row_ind,"700000") - sum(so, iotable_u(row_ind,"col_sum",so));
display chk_u;

chk_fd(row_ind,"sum","sum") =
    sum((so,col_fd), iotable_fd(row_ind,col_fd,so))
    + sum((so,col_imp), iotable_fd(row_ind,col_imp,so))
    - (sum(col_fd, temp_io(row_ind,col_fd)) + sum(col_imp, temp_io(row_ind,col_imp)));
display chk_fd;

chk_va(col_ind,"sum") =
    sum(row_va, iotable_va(row_va,col_ind)) - sum(row_va, temp_io(row_va,col_ind));
display chk_va;

chk_fd_va("FD_sum","value") =
    sum((so,col_fd,row_ind), iotable_fd(row_ind,col_fd,so))
    + sum((so,col_imp,row_ind), iotable_fd(row_ind,col_imp,so));
chk_fd_va("VA_sum","value") = sum((row_va,col_ind), iotable_va(row_va,col_ind));
chk_fd_va("fd-va","value") = chk_fd_va("FD_sum","value") - chk_fd_va("VA_sum","value");

display chk_fd_va;

chk_out(col_ind,"col_sum") =
    sum((row_ind,so), iotable_u(row_ind,col_ind,so))
    + sum((row_va), iotable_va(row_va,col_ind));
chk_out(col_ind,"col_sum_") = sum(row_ind, iotable_v(row_ind,col_ind));
chk_out(col_ind,"col_diff") =
    chk_out(col_ind,"col_sum") - chk_out(col_ind,"col_sum_");

chk_out(row_ind,"row_sum") =
    sum((col_ind,so), iotable_u(row_ind,col_ind,so))
    + sum((col_fd_imp,so), iotable_fd(row_ind,col_fd_imp,so));
chk_out(row_ind,"row_sum_") = sum(col_ind, iotable_v(row_ind,col_ind));
chk_out(row_ind,"row_diff") =
    chk_out(row_ind,"row_sum") - chk_out(row_ind,"row_sum_");
display chk_out;

*       ----------------------------------------------------------------------
*       データの export
$ontext
iotable_u, iotable_v, iotable_fd, iotable_va の 4 つを japan_io_%year%.gdx に出力する．

$offtext
execute_unload '.%fs%data%fs%japan_io_%year%.gdx', iotable_u, iotable_v, iotable_fd, iotable_va, iotable_q, iotable_q_v;



* --------------------
* Local Variables:
* mode: gams
* coding: utf-8-dos
* fill-column: 80
* End:

