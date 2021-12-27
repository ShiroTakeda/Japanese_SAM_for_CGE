$title �Y�ƘA�֕\�� excel ���� GDX �t�@�C���ɕϊ�����v���O����
display "@ �Y�ƘA�֕\�� excel ���� GDX �t�@�C���ɕϊ�����v���O����";
$ontext
First-written:  <2015/12/09>

�P��
�E���̋��z�f�[�^��100���~�D
�E���ʗʂ͂��ꂼ��̌ŗL�P��

$offtext

*       Year of the data = 2005, 2011 or 2015
$if not setglobal year $setglobal year 2015

$setglobal fs %system.dirsep% 

$include .%fs%set%fs%basic_code_%year%.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_fd_imp,
        col_fd_, col_exp, col_imp, col_mar, col_ind;

set     item /
pro     "�w���҉��i"
pur     "���Y�҉��i"
inc_pro "�����W���i���Y�҉��i�j"
inc_pur "�����W���i�w���҉��i�j"
imp     "�A��"
m1      "��"
m2      "����"
m3      "�S��"
m4      "���H"
m5      "���C"
m6      "�`�p"
m7      "�q��"
m8      "���p�^��"
m9      "�q��"
/;

set     item_q /
q       "����"
value   "���z"
/;

set     item_o /
pro     "�w���҉��i"
pur     "���Y�҉��i"
drt_pro "���v�䗦�i���Y�҉��i�j"
drt_pur "���v�䗦�i�w���҉��i�j"
imp     "�A��"
m1      "��"
m2      "����"
m3      "�S��"
m4      "���H"
m5      "���C"
m6      "�`�p"
m7      "�q��"
m8      "���p�^��"
m9      "�q��"
/;

set     sp /
1
2       "������"
3       "������"
4       "���Y������"
5       "���Y������"
6       "���ƃ}�[�W��"
7       "�����ݕ��^��"
/;

parameter
    t_tonyu(*,*,*,item)         "�����\�i100���~�j"
    t_butsuryo(*,*,*,item_q)    "���ʕ\"
    t_sanshutsu(*,*,*,item_o)   "�Y�o�\�iV�\�A100���~�j"
;

$onecho > temp.txt
i=.%fs%source_data%fs%io_basic_%year%.xlsx o=.%fs%source_data%fs%temp_io_%year%.gdx
par=t_tonyu rng=tonyu!A3:Q70000 rdim=3 cdim=1
par=t_butsuryo rng=butsuryo!A3:E10000 rdim=3 cdim=1
par=t_sanshutsu rng=sanshutsu!A3:Q70000 rdim=3 cdim=1
$offecho

* �ȉ��̍s�͍ŏ��Ɏ��s����Ƃ��̂ݎ��s����΂悢�B
$call '=gdxxrw @temp.txt'

$gdxin .%fs%source_data%fs%temp_io_%year%.gdx

$load t_tonyu, t_butsuryo, t_sanshutsu

display t_tonyu, t_butsuryo, t_sanshutsu;

execute_unload ".%fs%source_data%fs%original_io_%year%.gdx", t_tonyu, t_butsuryo, t_sanshutsu, item, item_q, item_o, sp, row_bas, col_bas;

*       �s�v�ȃt�@�C�����폜
execute 'del temp.txt';
execute 'del .%fs%source_data%fs%temp_io_%year%.gdx';


* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: sjis-dos
* End:
