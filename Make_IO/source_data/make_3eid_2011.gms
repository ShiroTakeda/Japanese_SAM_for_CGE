$ontext

First-written:  <2014/03/10>>

+ 3eidデータを読み込む。
+ 部門や財の分類を普通の連関表のものに変換する。
+ 変換後のデータをexportする。

$offtext

*       Set non-zero to recreate if you want to recreate GDX file from Excel file.
$if not setglobal recreate $setglobal recreate 1

*       ディレクトリの区切り文字列
$setglobal fs %system.dirsep%

$include .%fs%set%fs%basic_code_2011.gms

display row_bas, row_st, row_va, row_ind, col_bas, col_st, col_fd, col_imp,
        col_mar, col_ind;

$ontext
「エネルギー起源」
原燃料種名      原燃料種名(詳細）
1       石　炭          コークス用
2                       吹込用
3                       輸入一般炭
4                       発電用輸入一般炭
5                       国産一般炭
6                       無煙炭
7       石炭製品        コークス
8                       コールタール
9                       練豆炭
10                      コークス炉ガス
11                      一般高炉ガス
12                      発電用高炉ガス
13                      転炉ガス
14      原　油          精製用純原油
15                      精製用粗残油
16                      発電用原油
17                      瀝青質混合物
18                      精製用NGLｺﾝﾃﾞﾝｾｰﾄ
19                      発電用NGLｺﾝﾃﾞﾝｾｰﾄ
20                      石油化学用NGLｺﾝﾃﾞﾝｾｰﾄ
21      石油製品        揮発油留分
22                      灯油留分
23                      軽油留分
24                      常圧残油
25                      分解揮発油
26                      分解軽油
27                      精製混合原料油
28                      純ナフサ
29                      改質生成油
30                      ガソリン
31                      ジェット燃料油
32                      灯　油
33                      軽　油
34                      A重油
35                      B重油
36                      一般用C重油
37                      発電用C重油
38                      潤滑油
39                      アスファルト
40                      他重質石油製品
41                      オイルコークス
42                      電気炉ガス
43                      製油所ガス
44                      ＬＰＧ
45                      回収硫黄
46      天然ガス        輸入天然ガス (LNG)
47                      ガス田･随伴ガス
48                      炭鉱ガス
49                      原油溶解ガス
50      都市ガス        一般ガス
51                      簡易ガス
52      発電            事業用水力発電
53                      原子力発電
54      再生可能･未活用エネルギー
55      石油製品（国際輸送）    ジェット燃料油（国外給油）
56                              一般C重油（国外給油）
57      エネルギー転換用        炭素バランス調整量

$offtext

set     so_n_e 3EIDにおける排出源（エネルギー起源） /
1       コークス用
2       吹込用
3       輸入一般炭
4       発電用輸入一般炭
5       国産一般炭
6       無煙炭
7       コークス
8       コールタール
9       練豆炭
10      コークス炉ガス
11      一般高炉ガス
12      発電用高炉ガス
13      転炉ガス
14      精製用純原油
15      精製用粗残油
16      発電用原油
17      瀝青質混合物
18      精製用NGLｺﾝﾃﾞﾝｾｰﾄ
19      発電用NGLｺﾝﾃﾞﾝｾｰﾄ
20      石油化学用NGLｺﾝﾃﾞﾝｾｰﾄ
21      揮発油留分
22      灯油留分
23      軽油留分
24      常圧残油
25      分解揮発油
26      分解軽油
27      精製混合原料油
28      純ナフサ
29      改質生成油
30      ガソリン
31      ジェット燃料油
32      灯　油
33      軽　油
34      A重油
35      B重油
36      一般用C重油
37      発電用C重油
38      潤滑油
39      アスファルト
40      他重質石油製品
41      オイルコークス
42      電気炉ガス
43      製油所ガス
44      ＬＰＧ
45      回収硫黄
46      輸入天然ガス (LNG)
47      ガス田･随伴ガス
48      炭鉱ガス
49      原油溶解ガス
50      一般ガス
51      簡易ガス
52      事業用水力発電
53      原子力発電
54      再生可能･未活用エネルギー
55      ジェット燃料油（国外給油）
56      一般C重油（国外給油）
57      炭素バランス調整量
/;
display so_n_e;

set     so_n_ne 3EIDにおける排出源（非エネルギー起源） /
1       発電及び熱供給
2       石油精製
3       固体燃料製造及び他エネルギー産業
4       鉄鋼
5       非鉄金属
6       化学
7       パルプ・紙
8       食品加工・飲料
9       その他産業
10      その他産業（重複補正）
11      航空機
12      自動車
13      鉄道
14      船舶
15      "業務/公共"
16      家庭
17      農林水産業
18      石炭採掘 坑内掘
19      石炭採掘 露天掘り
20      固体燃料転換
21      石油生産（生産）
22      石油生産（輸送）
23      "石油生産（精製/貯蔵）"
24      天然ガス生産（生産）
25      天然ガス生産（処理）
26      天然ガス生産（輸送及び貯蔵）
27      天然ガス生産（供給）
28      通気弁
29      フレアリング
30      その他（地熱発電）
31      航空機（国際バンカー油）
32      船舶（国際バンカー油）
33      セメント製造
34      生石灰製造
35      ガラス製造
36      セラミックス製品製造
37      その他の用途でのソーダ灰の使用
38      その他プロセスでの炭酸塩の使用（その他）
39      アンモニア製造
40      硝酸製造
41      アジピン酸製造
42      カプロラクタム、グリオキサール、グリオキシル酸
43      カーバイド
44      二酸化チタン
45      メタノール
46      エチレン
47      "1,2-ジクロロエタン"
48      酸化エチレン
49      アクリルニトリル
50      カーボンブラック
51      その他（スチレン）
52      その他（無水フタル酸）
53      その他（無水マレイン酸）
54      その他（水素）
55      "HCFC-22の製造に伴う副生HCFC-23の排出"
56      "HFCs、PFC、SF6、NF3製造時の漏出"
57      "鉄鋼製造における電気炉の使用"
58      "鉄鋼製造における石灰石・ドロマイトの使用"
59      フェロアロイ製造
60      アルミニウム製造
61      マグネシウム製造
62      潤滑油の使用
63      パラフィンろうの使用
64      その他（尿素触媒）
65      その他（NMVOC焼却）
66      半導体製造
67      液晶製造
68      家庭用冷蔵庫の製造
69      家庭用冷蔵庫の使用
70      家庭用冷蔵庫の廃棄
71      業務用冷凍空調機器（業務用冷凍空調機器）の製造
72      業務用冷凍空調機器（業務用冷凍空調機器）の使用
73      業務用冷凍空調機器（業務用冷凍空調機器）の廃棄
74      業務用冷凍空調機器（自動販売機）の製造
75      業務用冷凍空調機器（自動販売機）の使用
76      業務用冷凍空調機器（自動販売機）の廃棄
77      固定空調機器（家庭用エアコン）の製造
78      固定空調機器（家庭用エアコン）の使用
79      固定空調機器（家庭用エアコン）の廃棄
80      輸送機器用空調機器（カーエアコン）の製造
81      輸送機器用空調機器（カーエアコン）の使用
82      輸送機器用空調機器（カーエアコン）の廃棄
83      発泡剤の製造
84      発泡剤の使用・廃棄
85      消火剤の使用
86      医療品製造業（MDI）の製造
87      医療品製造業（MDI）の使用・廃棄
88      一般用エアゾールの製造
89      一般用エアゾールの使用・廃棄
90      溶剤の使用・廃棄
91      電気設備の製造
92      電気設備の使用・廃棄
93      防衛利用
94      加速器
95      その他（鉄道用シリコン整流器）
96      医療利用
97      半導体・液晶製造工程における利用
98      食品・飲料産業
99      乳用牛の消化管内発酵
100     肉牛の消化管内発酵
101     めん羊の消化管内発酵
102     豚の消化管内発酵
103     水牛の消化管内発酵
104     山羊の消化管内発酵
105     馬の消化管内発酵
106     乳用牛の排せつ物管理
107     肉牛の排せつ物管理
108     めん羊の排せつ物管理
109     豚の排せつ物管理
110     家禽類の排せつ物管理
111     水牛の排せつ物管理
112     山羊の排せつ物管理
113     馬の排せつ物管理
114     排せつ物管理（その他）
115     排せつ物管理（間接排出）
116     灌漑水田
117     直接排出（合成肥料）
118     直接排出（有機質肥料）
119     直接排出（放牧家畜の排せつ物）
120     直接排出（作物残渣）
121     直接排出（土壌炭素の無機化）
122     直接排出（有機質土壌の耕起）
123     間接排出（大気沈降）
124     間接排出（窒素溶脱・流出）
125     穀物の野焼き
126     豆類の野焼き
127     根菜類の野焼き
128     サトウキビの野焼き
129     野焼き（その他）
130     石灰施用
131     尿素施用
132     固形廃棄物の処分（管理処分場）
133     固形廃棄物の処分（不適正処分）
134     コンポスト化
135     廃棄物の焼却（一般廃棄物）
136     廃棄物の焼却（産業廃棄物）
137     生活排水の処理
138     産業排水の処理
139     その他（石油由来の界面活性剤の分解）
140     石油製品（国際輸送）    ジェット燃料油（国外給油）
141     一般C重油（国外給油）
/;
display so_n_ne;

parameter
    co2_temp(col_bas,so_n_e)
    co2_ne_temp(col_bas,so_n_ne)
    co2_contrib_temp(col_bas,so_n_e)
;
$onecho > command.txt
i=.%fs%source_data%fs%3EID_2011.xlsx o=.%fs%source_data%fs%3EID_2011.gdx
par=co2_temp rng=CO2!D5:BI404 rdim=1 cdim=1
par=co2_ne_temp rng=neCO2!D5:EO404 rdim=1 cdim=1
par=co2_contrib_temp rng=contribution!D5:BI404 rdim=1 cdim=1
$offecho
$if not %recreate%==0 $call '=gdxxrw @command.txt';

$gdxin .%fs%source_data%fs%3EID_2011.gdx
$load co2_temp
$load co2_ne_temp
$load co2_contrib_temp

display co2_temp, co2_ne_temp, co2_contrib_temp;

set     so_e(row_bas) 連関表の分類による排出源 /
0621011        石炭
0621012        原油
0621013        天然ガス
2111011        ガソリン
2111012        ジェット燃料油
2111013        灯油
2111014        軽油
2111015        Ａ重油
2111016        Ｂ重油・Ｃ重油
2111017        ナフサ
2111018        液化石油ガス
2111019        その他の石油製品
2121011        コークス
2121019        その他の石炭製品
4621011        都市ガス
/;

$ontext
21      石油製品        揮発油留分
22                      灯油留分
23                      軽油留分
24                      常圧残油
25                      分解揮発油
26                      分解軽油
27                      精製混合原料油
29                      改質生成油
45                      回収硫黄
52      発電            事業用水力発電
53                      原子力発電
54      再生可能･未活用エネルギー
57      エネルギー転換用        炭素バランス調整量
$offtext
set map_so_e(so_e,so_n_e) /
0621011.(1,2,3,4,5,6)   石炭
0621012.(14,15,16,17,18,19,20)      原油
0621013.(46,47,48,49)   天然ガス
2111011.30              ガソリン
2111012.(31,55)         ジェット燃料油
2111013.32              灯油
2111014.33              軽油
2111015.34              Ａ重油
2111016.(35,36,37,56)   Ｂ重油・Ｃ重油
2111017.28              ナフサ
2111018.44              液化石油ガス
2111019.(38,39,40,41,42,43)   その他の石油製品
2121011.(7)             コークス
2121019.(8,9,10,11,12,13)  その他の石炭製品
4621011.(50,51)         都市ガス
/;

display so_e, map_so_e;

parameter
    iotable_co2_data(so_e,*)            "CO2 emissions (MtCO2)"
    iotable_co2_data_ne(*)              "CO2 emissions (MtCO2) 非エネルギー起源"
    iotable_co2_contrib(so_e,*)         "CO2 emissions contribution flag (non-0 or 0)"
    co2_sf                              Scale factor
;
co2_sf = 1e-6;
display co2_sf;

iotable_co2_data(so_e,col_bas)
    = (sum(so_n_e$map_so_e(so_e,so_n_e), co2_temp(col_bas,so_n_e))) * co2_sf;

display iotable_co2_data;

parameter chk_co2       Check CO2 emission
          chk_co2_total Check CO2 emission;

chk_co2(so_e,"sum_ind") = sum(col_bas$col_ind(col_bas), iotable_co2_data(so_e,col_bas));
chk_co2(so_e,"sum_fd") = sum(col_bas$col_fd(col_bas), iotable_co2_data(so_e,col_bas));
chk_co2(so_e,"sum") = chk_co2(so_e,"sum_ind") + chk_co2(so_e,"sum_fd");
chk_co2("sum",col_bas) = sum(so_e, iotable_co2_data(so_e,col_bas));
chk_co2("sum","sum_ind") = sum(so_e, chk_co2(so_e,"sum_ind"));
chk_co2("sum","sum_fd") = sum(so_e, chk_co2(so_e,"sum_fd"));
chk_co2("sum","sum") = sum(so_e, chk_co2(so_e,"sum"));
display chk_co2;

chk_co2_total("sum_ind","MtCO2") = chk_co2("sum","sum_ind");
chk_co2_total("sum_fd","MtCO2") = chk_co2("sum","sum_fd");
chk_co2_total("sum","MtCO2") = chk_co2("sum","sum");
display chk_co2_total;

$ontext
非エネルギー起源のCO2

「セメント」と「その他の窯業・土石製品」部門のみを考慮。

252101.33       セメント
259909.34       その他の窯業・土石製品
$offtext

iotable_co2_data_ne("252101") = co2_ne_temp("252101","33") * co2_sf;
iotable_co2_data_ne("259909") = co2_ne_temp("259909","34") * co2_sf;

display iotable_co2_data_ne;

iotable_co2_contrib(so_e,col_bas)
    = sum(so_n_e$map_so_e(so_e,so_n_e), co2_contrib_temp(col_bas,so_n_e));

display iotable_co2_contrib;

*       ----------------------------------------------------------------------
*       データの export
display "@ データの export";
$ontext
CO2データを export

$offtext
execute_unload '.%fs%data%fs%japan_io_2011_co2.gdx', iotable_co2_data, iotable_co2_data_ne, iotable_co2_contrib;

* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:
