$ontext

連関表の基本分類

SET      row_bas        行部門 (全部)
SET      row_st         行部門 (合計等)
SET      row_va         行部門 (付加価値部門)
SET      row_ind        行部門 (内生部門のみ)

SET      col_bas        列部門 (全部)
SET      col_st         列部門 (合計等)
SET      col_fd         列部門 (最終需要部門)
SET      col_fd_imp     列部門 (最終需要部門) 輸入も含む
SET      col_fd_        列部門 (最終需要部門) 輸出は除く
SET      col_exp        列部門 (輸出関連)
SET      col_imp        列部門 (輸入関連)
SET      col_mar        列部門 (商業マージン・運賃関連)
SET      col_ind        列部門 (内生部門のみ)

* SET    col_fcf        固定資本マトリックスに現れる列部門
* SET    row_fcf        固定資本マトリックスに現れる行部門 (資本財として利用される財)


$offtext
set row_bas "行部門 (基本分類)" /
0111011        米
0111012        稲わら
0111021        小麦（国産）
0111022        小麦（輸入）
0111023        大麦（国産）
0111024        大麦（輸入）
0112011        かんしょ
0112012        ばれいしょ
0112021        大豆（国産）
0112022        大豆（輸入）
0112029        その他の豆類
0113001        野菜
0114011        かんきつ
0114012        りんご
0114019        その他の果実
0115011        砂糖原料作物
0115021        コーヒー豆・カカオ豆（輸入）
0115029        その他の飲料用作物
0115091        雑穀
0115092        油糧作物
0115093        食用工芸作物（除別掲）
0116011        飼料作物
0116021        種苗
0116031        花き・花木類
0116091        葉たばこ
0116092        生ゴム（輸入）
0116093        綿花（輸入）
0116099        その他の非食用耕種作物（除別掲）
0121011        生乳　
0121019        その他の酪農生産物
0121021        鶏卵
0121031        肉鶏
0121041        豚
0121051        肉用牛
0121091        羊毛
0121099        その他の畜産
0131011        獣医業
0131021        農業サービス（除獣医業）
0211011        育林
0212011        素材（国産）
0212012        素材（輸入）
0213011        特用林産物（含狩猟業）
0311001        海面漁業（国産）
0311002        海面漁業（輸入）
0311041        海面養殖業
0312001        内水面漁業・養殖業
0611011        鉄鉱石
0611012        非鉄金属鉱物
0621011        石灰石
0621019        その他の窯業原料鉱物
0622011        砂利・採石
0622021        砕石
0629099        その他の非金属鉱物
0711011        石炭
0711012        原油
0711013        天然ガス
1111011        牛肉（枝肉）
1111012        豚肉（枝肉）
1111013        鶏肉
1111014        その他の肉（枝肉）
1111015        と畜副産物（含肉鶏処理副産物）
1112011        肉加工品
1112021        畜産びん・かん詰
1112031        飲用牛乳
1112032        乳製品
1113011        冷凍魚介類
1113021        塩・干・くん製品
1113031        水産びん・かん詰
1113041        ねり製品
1113099        その他の水産食品
1114011        精米
1114019        その他の精穀
1114021        小麦粉
1114029        その他の製粉
1115011        めん類
1115021        パン類
1115031        菓子類
1116011        農産びん・かん詰
1116021        農産保存食料品（除びん・かん詰）
1117011        精製糖
1117019        その他の砂糖・副産物
1117021        でん粉
1117031        ぶどう糖・水あめ・異性化糖
1117041        植物油脂
1117042        加工油脂
1117043        植物原油かす
1117051        動物油脂
1117061        調味料
1119011        冷凍調理食品
1119021        レトルト食品
1119031        そう菜・すし・弁当
1119041        学校給食（国公立）★★
1119051        学校給食（私立）★
1119099        その他の食料品
1121011        清酒
1121021        ビール
1121031        ウィスキー類
1121099        その他の酒類
1129011        茶・コーヒー
1129021        清涼飲料
1129031        製氷
1131011        飼料
1131021        有機質肥料（除別掲）
1141011        たばこ
1511011        紡績糸
1512011        綿・スフ織物（含合繊短繊維織物）
1512021        絹・人絹織物（含合繊長繊維織物）
1512031        毛織物・麻織物・その他の織物
1513011        ニット生地
1514011        染色整理
1519011        綱・網
1519021        じゅうたん・床敷物
1519031        繊維製衛生材料
1519099        その他の繊維工業製品
1521011        織物製衣服
1521021        ニット製衣服
1522099        その他の衣服・身の回り品
1529011        寝具
1529099        その他の繊維既製品
1611011        製材
1611021        合板
1611031        木材チップ
1619091        建設用木製品
1619099        その他の木製品（除別掲）
1711011        木製家具・装備品
1711021        木製建具
1711031        金属製家具・装備品
1811011        パルプ
1811021        古紙
1812011        洋紙・和紙
1812021        板紙
1813011        段ボール
1813021        塗工紙・建設用加工紙
1821011        段ボール箱
1821099        その他の紙製容器
1829011        紙製衛生材料・用品
1829099        その他のパルプ・紙・紙加工品
1911011        印刷・製版・製本
2011011        化学肥料
2021011        ソーダ灰
2021012        か性ソーダ
2021013        液体塩素
2021019        その他のソーダ工業製品
2029011        酸化チタン
2029012        カーボンブラック
2029019        その他の無機顔料
2029021        圧縮ガス・液化ガス
2029031        原塩
2029032        塩
2029099        その他の無機化学工業製品
2031011        エチレン
2031012        プロピレン
2031019        その他の石油化学基礎製品
2031021        純ベンゼン
2031022        純トルエン
2031023        キシレン
2031029        その他の石油化学系芳香族製品
2032011        合成アルコール類
2032012        酢酸
2032013        二塩化エチレン
2032014        アクリロニトリル
2032015        エチレングリコール
2032016        酢酸ビニルモノマー
2032019        その他の脂肪族中間物
2032021        スチレンモノマー
2032022        合成石炭酸
2032023        テレフタル酸（高純度）
2032024        カプロラクタム
2032029        その他の環式中間物
2033011        合成ゴム
2039011        メタン誘導品
2039021        油脂加工製品
2039031        可塑剤
2039041        合成染料
2039099        その他の有機化学工業製品
2041011        熱硬化性樹脂
2041021        ポリエチレン（低密度）
2041022        ポリエチレン（高密度）
2041023        ポリスチレン
2041024        ポリプロピレン
2041025        塩化ビニル樹脂
2041031        高機能性樹脂
2041099        その他の合成樹脂
2051011        レーヨン・アセテート
2051021        合成繊維
2061011        医薬品
2071011        石けん・合成洗剤
2071012        界面活性剤
2071021        化粧品・歯磨
2072011        塗料
2072021        印刷インキ
2073011        写真感光材料
2074011        農薬
2079011        ゼラチン・接着剤
2079091        触媒
2079099        その他の化学最終製品（除別掲）
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
2121021        舗装材料
2211011        プラスチックフィルム・シート
2211012        プラスチック板・管・棒
2211013        プラスチック発泡製品
2211014        工業用プラスチック製品
2211015        強化プラスチック製品
2211016        プラスチック製容器
2211017        プラスチック製日用雑貨・食卓用品
2211019        その他のプラスチック製品
2311011        タイヤ・チューブ
2319011        ゴム製履物
2319021        プラスチック製履物
2319099        その他のゴム製品
2411011        革製履物
2412011        製革・毛皮
2412021        かばん・袋物・その他の革製品
2511011        板ガラス
2511012        安全ガラス・複層ガラス
2512011        ガラス繊維・同製品
2519091        ガラス製加工素材
2519099        その他のガラス製品（除別掲）
2521011        セメント
2522011        生コンクリート
2523011        セメント製品
2531011        建設用陶磁器
2531012        工業用陶磁器
2531013        日用陶磁器
2599011        耐火物
2599021        その他の建設用土石製品
2599031        炭素・黒鉛製品
2599041        研磨材
2599099        その他の窯業・土石製品
2611011        銑鉄
2611021        フェロアロイ
2611031        粗鋼（転炉）
2611041        粗鋼（電気炉）
2612011        鉄屑
2621011        普通鋼形鋼
2621012        普通鋼鋼板
2621013        普通鋼鋼帯
2621014        普通鋼小棒
2621015        その他の普通鋼熱間圧延鋼材
2621016        特殊鋼熱間圧延鋼材
2622011        普通鋼鋼管
2622012        特殊鋼鋼管
2623011        普通鋼冷間仕上鋼材
2623012        特殊鋼冷間仕上鋼材
2623021        めっき鋼材
2631011        鍛鋼
2631012        鋳鋼
2631021        鋳鉄管
2631031        鋳鉄品
2631032        鍛工品（鉄）
2649011        鉄鋼シャースリット業
2649099        その他の鉄鋼製品
2711011        銅
2711021        鉛・亜鉛（含再生）
2711031        アルミニウム（含再生）
2711099        その他の非鉄金属地金
2712011        非鉄金属屑
2721011        電線・ケーブル
2721021        光ファイバケーブル
2722011        伸銅品
2722021        アルミ圧延製品
2722031        非鉄金属素形材
2722041        核燃料
2722099        その他の非鉄金属製品
2811011        建設用金属製品
2812011        建築用金属製品
2891011        ガス・石油機器及び暖厨房機器
2899011        ボルト・ナット・リベット及びスプリング
2899021        金属製容器及び製缶板金製品
2899031        配管工事付属品
2899032        粉末や金製品
2899033        刃物及び道具類
2899091        金属プレス製品
2899092        金属線製品
2899099        その他の金属製品（除別掲）
3011011        ボイラ
3011021        タービン
3011031        原動機
3012011        運搬機械
3013011        冷凍機・温湿調整装置
3019011        ポンプ及び圧縮機
3019021        機械工具
3019099        その他の一般産業機械及び装置
3021011        建設・鉱山機械
3022011        化学機械
3023011        産業用ロボット
3024011        金属工作機械
3024021        金属加工機械
3029011        農業用機械
3029021        繊維機械
3029031        食品機械・同装置
3029041        半導体製造装置
3029051        真空装置・真空機器
3029091        製材・木材加工・合板機械
3029092        パルプ装置・製紙機械
3029093        印刷・製本・紙工機械
3029094        鋳造装置
3029095        プラスチック加工機械
3029099        その他の特殊産業用機械（除別掲）
3031011        金型
3031021        ベアリング
3031099        その他の一般機械器具及び部品
3111011        複写機
3111099        その他の事務用機械
3112011        自動販売機
3112012        娯楽用機器
3112019        その他のサービス用機器
3211011        発電機器
3211012        電動機
3211021        変圧器・変成器
3211031        開閉制御装置及び配電盤
3211041        配線器具
3211051        内燃機関電装品
3211099        その他の産業用電気機器
3221011        電子応用装置
3231011        電気計測器
3241011        電球類
3241021        電気照明器具
3241031        電池
3241099        その他の電気機械器具
3251011        民生用エアコンディショナ
3251021        民生用電気機器（除エアコン）
3311011        ビデオ機器
3311021        電気音響機器
3311031        ラジオ・テレビ受信機
3321011        有線電気通信機器
3321021        携帯電話機
3321031        無線電気通信機器（除携帯電話機）
3321099        その他の電気通信機器
3331011        パーソナルコンピュータ
3331021        電子計算機本体（除パソコン）
3331031        電子計算機付属装置
3411011        半導体素子
3411021        集積回路
3421011        電子管
3421021        液晶素子
3421031        磁気テープ・磁気ディスク
3421099        その他の電子部品
3511011        乗用車
3521011        トラック・バス・その他の自動車
3531011        二輪自動車
3541011        自動車車体
3541021        自動車用内燃機関・同部分品
3541031        自動車部品
3611011        鋼船
3611021        その他の船舶
3611031        舶用内燃機関
3611101        船舶修理
3621011        鉄道車両
3621101        鉄道車両修理
3622011        航空機
3622101        航空機修理
3629011        自転車
3629091        産業用運搬車両
3629099        その他の輸送機械（除別掲）
3711011        カメラ
3711099        その他の光学機械
3712011        時計
3719011        理化学機械器具
3719021        分析器・試験機・計量器・測定器
3719031        医療用機械器具
3911011        がん具
3911021        運動用品
3919011        楽器
3919021        情報記録物
3919031        筆記具・文具
3919041        身辺細貨品
3919051        畳・わら加工品
3919061        武器
3919099        その他の製造工業製品
3921011        再生資源回収・加工処理
4111011        住宅建築（木造）
4111021        住宅建築（非木造）
4112011        非住宅建築（木造）
4112021        非住宅建築（非木造）
4121011        建設補修
4131011        道路関係公共事業
4131021        河川・下水道・その他の公共事業
4131031        農林関係公共事業
4132011        鉄道軌道建設
4132021        電力施設建設
4132031        電気通信施設建設
4132099        その他の土木建設
5111001        事業用電力
5111041        自家発電
5121011        都市ガス
5122011        熱供給業
5211011        上水道・簡易水道
5211021        工業用水
5211031        下水道★★
5212011        廃棄物処理（公営）★★
5212021        廃棄物処理（産業）
6111011        卸売
6112011        小売
6211011        公的金融（帰属利子）
6211012        民間金融（帰属利子）
6211013        公的金融（手数料）
6211014        民間金融（手数料）
6212011        生命保険
6212021        損害保険
6411011        不動産仲介・管理業
6411021        不動産賃貸業
6421011        住宅賃貸料
6422011        住宅賃貸料（帰属家賃）
7111011        鉄道旅客輸送
7112011        鉄道貨物輸送
7121011        バス
7121021        ハイヤー・タクシー
7122011        道路貨物輸送（除自家輸送）
7131011        自家輸送（旅客自動車）
7132011        自家輸送（貨物自動車）
7141011        外洋輸送
7142011        沿海・内水面旅客輸送
7142012        沿海・内水面貨物輸送
7143011        港湾運送
7151011        国際航空輸送
7151012        国内航空旅客輸送
7151013        国内航空貨物輸送
7151014        航空機使用事業
7161011        貨物利用運送
7171011        倉庫
7181011        こん包
7189011        道路輸送施設提供
7189021        水運施設管理★★
7189031        その他の水運付帯サービス
7189041        航空施設管理（国公営）★★
7189051        航空施設管理（産業）
7189061        その他の航空付帯サービス
7189099        旅行・その他の運輸付帯サービス
7311011        郵便・信書便
7312011        固定電気通信
7312021        移動電気通信
7312031        その他の電気通信
7319099        その他の通信サービス
7321011        公共放送
7321021        民間放送
7321031        有線放送
7331011        ソフトウェア業
7331012        情報処理・提供サービス
7341011        インターネット附随サービス
7351011        映像情報制作・配給業
7351021        新聞
7351031        出版
7351041        ニュース供給・興信所
8111011        公務（中央）★★
8112011        公務（地方）★★
8211011        学校教育（国公立）★★
8211021        学校教育（私立）★
8213011        社会教育（国公立）★★
8213021        社会教育（非営利）★
8213031        その他の教育訓練機関（国公立）★★
8213041        その他の教育訓練機関（産業）
8221011        自然科学研究機関（国公立）★★
8221021        人文科学研究機関（国公立）★★
8221031        自然科学研究機関（非営利）★
8221041        人文科学研究機関（非営利）★
8221051        自然科学研究機関（産業）
8221061        人文科学研究機関（産業）
8222011        企業内研究開発
8311011        医療（国公立）
8311021        医療（公益法人等）
8311031        医療（医療法人等）
8312011        保健衛生（国公立）★★
8312021        保健衛生（産業）
8313011        社会保険事業（国公立）★★
8313021        社会保険事業（非営利）★
8313031        社会福祉（国公立）★★
8313041        社会福祉（非営利）★
8313051        社会福祉（産業）
8314011        介護（居宅）
8314021        介護（施設）
8411011        対企業民間非営利団体
8411021        対家計民間非営利団体（除別掲）★
8511011        テレビ・ラジオ広告
8511012        新聞・雑誌・その他の広告
8512011        産業用機械器具（除建設機械器具）賃貸業
8512012        建設機械器具賃貸業
8512013        電子計算機・同関連機器賃貸業
8512014        事務用機械器具（除電算機等）賃貸業
8512015        スポーツ・娯楽用品・その他の物品賃貸業
8513011        貸自動車業
8514101        自動車修理
8515101        機械修理
8519011        建物サービス
8519021        法務・財務・会計サービス
8519031        土木建築サービス
8519041        労働者派遣サービス
8519099        その他の対事業所サービス
8611011        映画館
8611021        興行場（除別掲）・興行団
8611031        遊戯場
8611041        競輪・競馬等の競走場・競技団
8611051        スポーツ施設提供業・公園・遊園地
8611099        その他の娯楽
8612011        一般飲食店（除喫茶店）
8612021        喫茶店
8612031        遊興飲食店
8613011        宿泊業
8614011        洗濯業
8614021        理容業
8614031        美容業
8614041        浴場業
8614099        その他の洗濯・理容・美容・浴場業
8619011        写真業
8619021        冠婚葬祭業
8619031        各種修理業（除別掲）
8619041        個人教授業
8619099        その他の対個人サービス
8900000        事務用品
9000000        分類不明
9099000        内生部門計
9110010        宿泊・日当
9110020        交際費
9110030        福利厚生費
9311000        賃金・俸給
9312000        社会保険料（雇用主負担）
9313000        その他の給与及び手当
9401000        営業余剰
9402000        資本減耗引当
9403000        資本減耗引当（社会資本等減耗分）
9404000        間接税（除関税・輸入品商品税）
9405000        （控除）経常補助金
9500000        粗付加価値部門計
9700000        国内生産額
/;
set row_st(row_bas) "行部門 (合計等)" /
9099000        内生部門計
9500000        粗付加価値部門計
9700000        国内生産額
/;
set row_va(row_bas) "付加価値部門 (基本分類)" /
9110010        宿泊・日当
9110020        交際費
9110030        福利厚生費
9311000        賃金・俸給
9312000        社会保険料（雇用主負担）
9313000        その他の給与及び手当
9401000        営業余剰
9402000        資本減耗引当
9403000        資本減耗引当（社会資本等減耗分）
9404000        間接税（除関税・輸入品商品税）
9405000        （控除）経常補助金
/;
set row_ind(row_bas)    "行内生部門 (基本分類)";
row_ind(row_bas) = yes;
row_ind(row_bas)$row_st(row_bas)=no;
row_ind(row_bas)$row_va(row_bas)=no;

set col_bas "列部門 (基本分類)" /
011101        米
011102        麦類
011201        いも類
011202        豆類
011301        野菜（露地）
011302        野菜（施設）
011401        果実
011501        砂糖原料作物
011502        飲料用作物
011509        その他の食用耕種作物
011601        飼料作物
011602        種苗
011603        花き・花木類
011609        その他の非食用耕種作物
012101        酪農
012102        鶏卵
012103        肉鶏
012104        豚
012105        肉用牛
012109        その他の畜産
013101        獣医業
013102        農業サービス（除獣医業）
021101        育林
021201        素材
021301        特用林産物（含狩猟業）
031101        沿岸漁業
031102        沖合漁業
031103        遠洋漁業
031104        海面養殖業
031201        内水面漁業
031202        内水面養殖業
061101        金属鉱物
062101        窯業原料鉱物
062201        砂利・採石
062202        砕石
062909        その他の非金属鉱物
071101        石炭・原油・天然ガス
111101        と畜（含肉鶏処理）
111201        肉加工品
111202        畜産びん・かん詰
111203        酪農品
111301        冷凍魚介類
111302        塩・干・くん製品
111303        水産びん・かん詰
111304        ねり製品
111309        その他の水産食品
111401        精穀
111402        製粉
111501        めん類
111502        パン類
111503        菓子類
111601        農産びん・かん詰
111602        農産保存食料品（除びん・かん詰）
111701        砂糖
111702        でん粉
111703        ぶどう糖・水あめ・異性化糖
111704        植物油脂
111705        動物油脂
111706        調味料
111901        冷凍調理食品
111902        レトルト食品
111903        そう菜・すし・弁当
111904        学校給食（国公立）★★
111905        学校給食（私立）★
111909        その他の食料品
112101        清酒
112102        ビール
112103        ウィスキー類
112109        その他の酒類
112901        茶・コーヒー
112902        清涼飲料
112903        製氷
113101        飼料
113102        有機質肥料（除別掲）
114101        たばこ
151101        紡績糸
151201        綿・スフ織物（含合繊短繊維織物）
151202        絹・人絹織物（含合繊長繊維織物）
151203        毛織物・麻織物・その他の織物
151301        ニット生地
151401        染色整理
151901        綱・網
151902        じゅうたん・床敷物
151903        繊維製衛生材料
151909        その他の繊維工業製品
152101        織物製衣服
152102        ニット製衣服
152209        その他の衣服・身の回り品
152901        寝具
152909        その他の繊維既製品
161101        製材
161102        合板
161103        木材チップ
161909        その他の木製品
171101        木製家具・装備品
171102        木製建具
171103        金属製家具・装備品
181101        パルプ
181201        洋紙・和紙
181202        板紙
181301        段ボール
181302        塗工紙・建設用加工紙
182101        段ボール箱
182109        その他の紙製容器
182901        紙製衛生材料・用品
182909        その他のパルプ・紙・紙加工品
191101        印刷・製版・製本
201101        化学肥料
202101        ソーダ工業製品
202901        無機顔料
202902        圧縮ガス・液化ガス
202903        塩
202909        その他の無機化学工業製品
203101        石油化学基礎製品
203102        石油化学系芳香族製品
203201        脂肪族中間物
203202        環式中間物
203301        合成ゴム
203901        メタン誘導品
203902        油脂加工製品
203903        可塑剤
203904        合成染料
203909        その他の有機化学工業製品
204101        熱硬化性樹脂
204102        熱可塑性樹脂
204103        高機能性樹脂
204109        その他の合成樹脂
205101        レーヨン・アセテート
205102        合成繊維
206101        医薬品
207101        石けん・合成洗剤・界面活性剤
207102        化粧品・歯磨
207201        塗料
207202        印刷インキ
207301        写真感光材料
207401        農薬
207901        ゼラチン・接着剤
207909        その他の化学最終製品
211101        石油製品
212101        石炭製品
212102        舗装材料
221101        プラスチック製品
231101        タイヤ・チューブ
231901        ゴム製履物
231902        プラスチック製履物
231909        その他のゴム製品
241101        革製履物
241201        製革・毛皮
241202        かばん・袋物・その他の革製品
251101        板ガラス・安全ガラス
251201        ガラス繊維・同製品
251909        その他のガラス製品
252101        セメント
252201        生コンクリート
252301        セメント製品
253101        陶磁器
259901        耐火物
259902        その他の建設用土石製品
259903        炭素・黒鉛製品
259904        研磨材
259909        その他の窯業・土石製品
261101        銑鉄
261102        フェロアロイ
261103        粗鋼（転炉）
261104        粗鋼（電気炉）
262101        熱間圧延鋼材
262201        鋼管
262301        冷間仕上鋼材
262302        めっき鋼材
263101        鋳鍛鋼
263102        鋳鉄管
263103        鋳鉄品及び鍛工品（鉄）
264901        鉄鋼シャースリット業
264909        その他の鉄鋼製品
271101        銅
271102        鉛・亜鉛（含再生）
271103        アルミニウム（含再生）
271109        その他の非鉄金属地金
272101        電線・ケーブル
272102        光ファイバケーブル
272201        伸銅品
272202        アルミ圧延製品
272203        非鉄金属素形材
272204        核燃料
272209        その他の非鉄金属製品
281101        建設用金属製品
281201        建築用金属製品
289101        ガス・石油機器及び暖厨房機器
289901        ボルト・ナット・リベット及びスプリング
289902        金属製容器及び製缶板金製品
289903        配管工事付属品・粉末や金製品・道具類
289909        その他の金属製品
301101        ボイラ
301102        タービン
301103        原動機
301201        運搬機械
301301        冷凍機・温湿調整装置
301901        ポンプ及び圧縮機
301902        機械工具
301909        その他の一般産業機械及び装置
302101        建設・鉱山機械
302201        化学機械
302301        産業用ロボット
302401        金属工作機械
302402        金属加工機械
302901        農業用機械
302902        繊維機械
302903        食品機械・同装置
302904        半導体製造装置
302905        真空装置・真空機器
302909        その他の特殊産業用機械
303101        金型
303102        ベアリング
303109        その他の一般機械器具及び部品
311101        複写機
311109        その他の事務用機械
311201        サービス用機器　
321101        回転電気機械
321102        変圧器・変成器
321103        開閉制御装置及び配電盤
321104        配線器具
321105        内燃機関電装品
321109        その他の産業用電気機器
322101        電子応用装置
323101        電気計測器
324101        電球類
324102        電気照明器具
324103        電池
324109        その他の電気機械器具
325101        民生用エアコンディショナ
325102        民生用電気機器（除エアコン）
331101        ビデオ機器
331102        電気音響機器
331103        ラジオ・テレビ受信機
332101        有線電気通信機器
332102        携帯電話機
332103        無線電気通信機器（除携帯電話機）
332109        その他の電気通信機器
333101        パーソナルコンピュータ
333102        電子計算機本体（除パソコン）
333103        電子計算機付属装置
341101        半導体素子
341102        集積回路
342101        電子管
342102        液晶素子
342103        磁気テープ・磁気ディスク
342109        その他の電子部品
351101        乗用車
352101        トラック・バス・その他の自動車
353101        二輪自動車
354101        自動車車体
354102        自動車用内燃機関・同部分品
354103        自動車部品
361101        鋼船
361102        その他の船舶
361103        舶用内燃機関
361110        船舶修理
362101        鉄道車両
362110        鉄道車両修理
362201        航空機
362210        航空機修理
362901        自転車
362909        その他の輸送機械
371101        カメラ
371109        その他の光学機械
371201        時計
371901        理化学機械器具
371902        分析器・試験機・計量器・測定器
371903        医療用機械器具
391101        がん具
391102        運動用品
391901        楽器
391902        情報記録物
391903        筆記具・文具
391904        身辺細貨品
391905        畳・わら加工品
391906        武器
391909        その他の製造工業製品
392101        再生資源回収・加工処理
411101        住宅建築（木造）
411102        住宅建築（非木造）
411201        非住宅建築（木造）
411202        非住宅建築（非木造）
412101        建設補修
413101        道路関係公共事業
413102        河川・下水道・その他の公共事業
413103        農林関係公共事業
413201        鉄道軌道建設
413202        電力施設建設
413203        電気通信施設建設
413209        その他の土木建設
511101        事業用原子力発電
511102        事業用火力発電
511103        水力・その他の事業用発電
511104        自家発電
512101        都市ガス
512201        熱供給業
521101        上水道・簡易水道
521102        工業用水
521103        下水道★★
521201        廃棄物処理（公営）★★
521202        廃棄物処理（産業）
611101        卸売
611201        小売
621101        金融
621201        生命保険
621202        損害保険
641101        不動産仲介・管理業
641102        不動産賃貸業
642101        住宅賃貸料
642201        住宅賃貸料（帰属家賃）
711101        鉄道旅客輸送
711201        鉄道貨物輸送
712101        バス
712102        ハイヤー・タクシー
712201        道路貨物輸送（除自家輸送）
713101        自家輸送（旅客自動車）
713201        自家輸送（貨物自動車）
714101        外洋輸送
714201        沿海・内水面輸送
714301        港湾運送
715101        航空輸送
716101        貨物利用運送
717101        倉庫
718101        こん包
718901        道路輸送施設提供
718902        水運施設管理★★
718903        その他の水運付帯サービス
718904        航空施設管理（国公営）★★
718905        航空施設管理（産業）
718906        その他の航空付帯サービス
718909        旅行・その他の運輸付帯サービス
731101        郵便・信書便
731201        固定電気通信
731202        移動電気通信
731203        その他の電気通信
731909        その他の通信サービス
732101        公共放送
732102        民間放送
732103        有線放送
733101        情報サービス
734101        インターネット附随サービス
735101        映像情報制作・配給業
735102        新聞
735103        出版
735104        ニュース供給・興信所
811101        公務（中央）★★
811201        公務（地方）★★
821101        学校教育（国公立）★★
821102        学校教育（私立）★
821301        社会教育（国公立）★★
821302        社会教育（非営利）★
821303        その他の教育訓練機関（国公立）★★
821304        その他の教育訓練機関（産業）
822101        自然科学研究機関（国公立）★★
822102        人文科学研究機関（国公立）★★
822103        自然科学研究機関（非営利）★
822104        人文科学研究機関（非営利）★
822105        自然科学研究機関（産業）
822106        人文科学研究機関（産業）
822201        企業内研究開発
831101        医療（国公立）
831102        医療（公益法人等）
831103        医療（医療法人等）
831201        保健衛生（国公立）★★
831202        保健衛生（産業）
831301        社会保険事業（国公立）★★
831302        社会保険事業（非営利）★
831303        社会福祉（国公立）★★
831304        社会福祉（非営利）★
831305        社会福祉（産業）
831401        介護（居宅）
831402        介護（施設）
841101        対企業民間非営利団体
841102        対家計民間非営利団体（除別掲）★
851101        広告
851201        物品賃貸業（除貸自動車）
851301        貸自動車業
851410        自動車修理
851510        機械修理
851901        建物サービス
851902        法務・財務・会計サービス
851903        土木建築サービス
851904        労働者派遣サービス
851909        その他の対事業所サービス
861101        映画館
861102        興行場（除別掲）・興行団
861103        遊戯場
861104        競輪・競馬等の競走場・競技団
861105        スポーツ施設提供業・公園・遊園地
861109        その他の娯楽
861201        一般飲食店（除喫茶店）
861202        喫茶店
861203        遊興飲食店
861301        宿泊業
861401        洗濯業
861402        理容業
861403        美容業
861404        浴場業
861409        その他の洗濯・理容・美容・浴場業
861901        写真業
861902        冠婚葬祭業
861903        各種修理業（除別掲）
861904        個人教授業
861909        その他の対個人サービス
890000        事務用品
900000        分類不明
909900        内生部門計
911000        家計外消費支出（列）
912100        家計消費支出
912200        対家計民間非営利団体消費支出
913110        中央政府集合的消費支出
913120        地方政府集合的消費支出
913130        中央政府個別的消費支出
913140        地方政府個別的消費支出
913210        中央政府集合的消費支出（社会資本等減耗分）
913220        地方政府集合的消費支出（社会資本等減耗分）
913230        中央政府個別的消費支出（社会資本等減耗分）
913240        地方政府個別的消費支出（社会資本等減耗分）
914100        国内総固定資本形成（公的）
914200        国内総固定資本形成（民間）
915010        生産者製品在庫純増
915020        半製品・仕掛品在庫純増
915030        流通在庫純増
915040        原材料在庫純増
920000        国内最終需要計
921000        国内需要合計
921110        輸出（普通貿易）
921120        輸出（特殊貿易）
921200        輸出（直接購入）
921300        調整項
922000        輸出計
930000        最終需要計
935000        需要合計
941110        （控除）輸入（普通貿易）
941120        （控除）輸入（特殊貿易）
941200        （控除）輸入（直接購入）
941300        （控除）関税
941400        （控除）輸入品商品税
942000        （控除）輸入計
950000        最終需要部門計
951000        商業マージン（卸売）
952000        商業マージン（小売）
961000        貨物運賃（鉄道）
962000        貨物運賃（道路）
963010        貨物運賃（沿海内水面）
963020        貨物運賃（港湾運送）
964000        貨物運賃（航空）
965000        貨物運賃（利用運送）
966000        貨物運賃（倉庫）
970000        国内生産額
/;
set col_st(col_bas) "列部門 (合計等)" /
909900        内生部門計
920000        国内最終需要計
921000        国内需要合計
922000        輸出計
930000        最終需要計
935000        需要合計
942000        （控除）輸入計
950000        最終需要部門計
970000        国内生産額
/;
set col_fd(col_bas) "最終需要部門 (基本分類)" /
911000        家計外消費支出（列）
912100        家計消費支出
912200        対家計民間非営利団体消費支出
913110        中央政府集合的消費支出
913120        地方政府集合的消費支出
913130        中央政府個別的消費支出
913140        地方政府個別的消費支出
913210        中央政府集合的消費支出（社会資本等減耗分）
913220        地方政府集合的消費支出（社会資本等減耗分）
913230        中央政府個別的消費支出（社会資本等減耗分）
913240        地方政府個別的消費支出（社会資本等減耗分）
914100        国内総固定資本形成（公的）
914200        国内総固定資本形成（民間）
915010        生産者製品在庫純増
915020        半製品・仕掛品在庫純増
915030        流通在庫純増
915040        原材料在庫純増
921110        輸出（普通貿易）
921120        輸出（特殊貿易）
921200        輸出（直接購入）
921300        調整項
/;
set col_fd_imp(col_bas) "最終需要部門 (基本分類) 輸入も含む" /
911000        家計外消費支出（列）
912100        家計消費支出
912200        対家計民間非営利団体消費支出
913110        中央政府集合的消費支出
913120        地方政府集合的消費支出
913130        中央政府個別的消費支出
913140        地方政府個別的消費支出
913210        中央政府集合的消費支出（社会資本等減耗分）
913220        地方政府集合的消費支出（社会資本等減耗分）
913230        中央政府個別的消費支出（社会資本等減耗分）
913240        地方政府個別的消費支出（社会資本等減耗分）
914100        国内総固定資本形成（公的）
914200        国内総固定資本形成（民間）
915010        生産者製品在庫純増
915020        半製品・仕掛品在庫純増
915030        流通在庫純増
915040        原材料在庫純増
921110        輸出（普通貿易）
921120        輸出（特殊貿易）
921200        輸出（直接購入）
921300        調整項
941110        （控除）輸入（普通貿易）
941120        （控除）輸入（特殊貿易）
941200        （控除）輸入（直接購入）
941300        （控除）関税
941400        （控除）輸入品商品税
/;
set col_fd_(col_bas) "最終需要部門 (基本分類) 輸出を除く" /
911000        家計外消費支出（列）
912100        家計消費支出
912200        対家計民間非営利団体消費支出
913110        中央政府集合的消費支出
913120        地方政府集合的消費支出
913130        中央政府個別的消費支出
913140        地方政府個別的消費支出
913210        中央政府集合的消費支出（社会資本等減耗分）
913220        地方政府集合的消費支出（社会資本等減耗分）
913230        中央政府個別的消費支出（社会資本等減耗分）
913240        地方政府個別的消費支出（社会資本等減耗分）
914100        国内総固定資本形成（公的）
914200        国内総固定資本形成（民間）
915010        生産者製品在庫純増
915020        半製品・仕掛品在庫純増
915030        流通在庫純増
915040        原材料在庫純増
/;
set col_exp(col_bas) "最終需要部門 (輸出関連)" /
921110        輸出（普通貿易）
921120        輸出（特殊貿易）
921200        輸出（直接購入）
921300        調整項
/;
set col_imp(col_bas) "最終需要 (輸入関連)" /
941110        （控除）輸入（普通貿易）
941120        （控除）輸入（特殊貿易）
941200        （控除）輸入（直接購入）
941300        （控除）関税
941400        （控除）輸入品商品税
/;
set col_mar(col_bas) "国内マージン・運賃" /
951000        商業マージン（卸売）
952000        商業マージン（小売）
961000        貨物運賃（鉄道）
962000        貨物運賃（道路）
963010        貨物運賃（沿海内水面）
963020        貨物運賃（港湾運送）
964000        貨物運賃（航空）
965000        貨物運賃（利用運送）
966000        貨物運賃（倉庫）
/;
set col_ind(col_bas)    "列内生部門 (基本分類)";
col_ind(col_bas)=yes;
col_ind(col_bas)$col_st(col_bas)=no;
col_ind(col_bas)$col_fd(col_bas)=no;
col_ind(col_bas)$col_imp(col_bas)=no;
col_ind(col_bas)$col_mar(col_bas)=no;
col_ind("921300")=no;

* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:
