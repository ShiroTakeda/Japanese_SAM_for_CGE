$title Y‹Æ˜AŠÖ•\‚ğ excel ‚©‚ç GDX ƒtƒ@ƒCƒ‹‚É•ÏŠ·‚·‚éƒvƒƒOƒ‰ƒ€
display "@ Y‹Æ˜AŠÖ•\‚ğ excel ‚©‚ç GDX ƒtƒ@ƒCƒ‹‚É•ÏŠ·‚·‚éƒvƒƒOƒ‰ƒ€";
$ontext
First-written:  <2015/12/09>

’PˆÊ
EŒ³‚Ì‹àŠzƒf[ƒ^‚Í100–œ‰~D
E•¨—Ê—Ê‚Í‚»‚ê‚¼‚ê‚ÌŒÅ—L’PˆÊ

$offtext

*       Year of the data = 2005, 2011 or 2015
$if not setglobal year $setglobal year 2015

$setglobal fs %system.dirsep% 

$include .%fs%set%fs%basic_code_%year%.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_fd_imp,
        col_fd_, col_exp, col_imp, col_mar, col_ind;

set     item /
pro     "w“üÒ‰¿Ši"
pur     "¶YÒ‰¿Ši"
inc_pro "“Š“üŒW”i¶YÒ‰¿Šij"
inc_pur "“Š“üŒW”iw“üÒ‰¿Šij"
imp     "—A“ü"
m1      "‰µ"
m2      "¬”„"
m3      "“S“¹"
m4      "“¹˜H"
m5      "‰ˆŠC"
m6      "`˜p"
m7      "q‹ó"
m8      "—˜—p‰^‘—"
m9      "‘qŒÉ"
/;

set     item_q /
q       "”—Ê"
value   "‹àŠz"
/;

set     item_o /
pro     "w“üÒ‰¿Ši"
pur     "¶YÒ‰¿Ši"
drt_pro "ù—v”ä—¦i¶YÒ‰¿Šij"
drt_pur "ù—v”ä—¦iw“üÒ‰¿Šij"
imp     "—A“ü"
m1      "‰µ"
m2      "¬”„"
m3      "“S“¹"
m4      "“¹˜H"
m5      "‰ˆŠC"
m6      "`˜p"
m7      "q‹ó"
m8      "—˜—p‰^‘—"
m9      "‘qŒÉ"
/;

set     sp /
1
2       "‹û“Š“ü"
3       "‹û”­¶"
4       "•›Y•¨“Š“ü"
5       "•›Y•¨”­¶"
6       "¤‹Æƒ}[ƒWƒ“"
7       "‘“à‰İ•¨‰^’À"
/;

parameter
    t_tonyu(*,*,*,item)         "“Š“ü•\i100–œ‰~j"
    t_butsuryo(*,*,*,item_q)    "•¨—Ê•\"
    t_sanshutsu(*,*,*,item_o)   "Yo•\iV•\A100–œ‰~j"
;

$onecho > temp.txt
i=.%fs%source_data%fs%io_basic_%year%.xlsx o=.%fs%source_data%fs%temp_io_%year%.gdx
par=t_tonyu rng=tonyu!A3:Q70000 rdim=3 cdim=1
par=t_butsuryo rng=butsuryo!A3:E10000 rdim=3 cdim=1
par=t_sanshutsu rng=sanshutsu!A3:Q70000 rdim=3 cdim=1
$offecho

* ˆÈ‰º‚Ìs‚ÍÅ‰‚ÉÀs‚·‚é‚Æ‚«‚Ì‚İÀs‚·‚ê‚Î‚æ‚¢B
$call '=gdxxrw @temp.txt'

$gdxin .%fs%source_data%fs%temp_io_%year%.gdx

$load t_tonyu, t_butsuryo, t_sanshutsu

display t_tonyu, t_butsuryo, t_sanshutsu;

execute_unload ".%fs%source_data%fs%original_io_%year%.gdx", t_tonyu, t_butsuryo, t_sanshutsu, item, item_q, item_o, sp, row_bas, col_bas;

*       •s—v‚Èƒtƒ@ƒCƒ‹‚ğíœ
execute 'del temp.txt';
execute 'del .%fs%source_data%fs%temp_io_%year%.gdx';


* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: sjis-dos
* End:
