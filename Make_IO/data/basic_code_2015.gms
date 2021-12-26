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

注:
分類コードの「P」はとっている。

$offtext

set row_bas "行部門 (基本分類)" /
0111011        米
0111012        稲わら
0111021        小麦
0111022        大麦
0112011        かんしょ
0112012        ばれいしょ
0112021        大豆
0112029        その他の豆類
0113001        野菜
0114011        果実
0115011        砂糖原料作物
0115021        コーヒー豆・カカオ豆（輸入）
0115029        その他の飲料用作物
0115091        雑穀
0115099        他に分類されない食用耕種作物
0116011        飼料作物
0116021        種苗
0116031        花き・花木類
0116091        葉たばこ
0116092        生ゴム（輸入）
0116093        綿花（輸入）
0116099        他に分類されない非食用耕種作物
0121011        生乳
0121019        その他の酪農生産物
0121021        肉用牛
0121031        豚
0121041        鶏卵
0121051        肉鶏
0121099        その他の畜産
0131011        獣医業
0131021        農業サービス（獣医業を除く。）
0151011        育林
0152011        素材
0153011        特用林産物（狩猟業を含む。）
0171011        海面漁業
0171021        海面養殖業
0172001        内水面漁業・養殖業
0611011        石炭
0611012        原油
0611013        天然ガス
0621011        砂利・採石
0621021        砕石
0629091        鉄鉱石
0629092        非鉄金属鉱物
0629093        石灰石
0629094        窯業原料鉱物（石灰石を除く。）
0629099        他に分類されない鉱物
1111011        牛肉
1111012        豚肉
1111013        鶏肉
1111014        その他の食肉
1111015        と畜副産物（肉鶏処理副産物を含む。）
1111021        飲用牛乳
1111022        乳製品
1111099        その他の畜産食料品
1112011        冷凍魚介類
1112021        塩・干・くん製品
1112031        水産びん・かん詰
1112041        ねり製品
1112099        その他の水産食料品
1113011        精米
1113019        その他の精穀
1113021        小麦粉
1113029        その他の製粉
1114011        めん類
1114021        パン類
1114031        菓子類
1115011        農産保存食料品
1116011        精製糖
1116019        その他の砂糖・副産物
1116021        でん粉
1116031        ぶどう糖・水あめ・異性化糖
1116041        植物油脂
1116042        動物油脂
1116043        加工油脂
1116044        植物原油かす
1116051        調味料
1119011        冷凍調理食品
1119021        レトルト食品
1119031        そう菜・すし・弁当
1119099        その他の食料品
1121011        清酒
1121021        ビール類
1121031        ウイスキー類
1121099        その他の酒類
1129011        茶・コーヒー
1129021        清涼飲料
1129031        製氷
1131011        飼料
1131021        有機質肥料（別掲を除く。）
1141011        たばこ
1511011        紡績糸
1512011        綿・スフ織物（合繊短繊維織物を含む。）
1512021        絹・人絹織物（合繊長繊維織物を含む。）
1512099        その他の織物
1513011        ニット生地
1514011        染色整理
1519091        綱・網
1519099        他に分類されない繊維工業製品
1521011        織物製衣服
1521021        ニット製衣服
1522099        その他の衣服・身の回り品
1529011        寝具
1529021        じゅうたん・床敷物
1529091        繊維製衛生材料
1529099        他に分類されない繊維既製品
1611011        製材
1611021        合板・集成材
1611031        木材チップ
1619091        建設用木製品
1619099        他に分類されない木製品
1621011        木製家具
1621021        金属製家具
1621031        木製建具
1621099        その他の家具・装備品
1631011        パルプ
1631021        古紙
1632011        洋紙・和紙
1632021        板紙
1633011        段ボール
1633021        塗工紙・建設用加工紙
1641011        段ボール箱
1641099        その他の紙製容器
1649011        紙製衛生材料・用品
1649099        その他のパルプ・紙・紙加工品
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
2041011        合成オクタノール・ブタノール
2041012        酢酸
2041013        二塩化エチレン
2041014        アクリロニトリル
2041015        エチレングリコール
2041016        酢酸ビニルモノマー
2041019        その他の脂肪族中間物
2041021        合成染料・有機顔料
2041022        スチレンモノマー
2041023        合成石炭酸
2041024        テレフタル酸・ジメチルテレフタレート
2041025        カプロラクタム
2041029        その他の環式中間物
2042011        合成ゴム
2049011        メタン誘導品
2049021        可塑剤
2049099        その他の有機化学工業製品
2051011        熱硬化性樹脂
2051021        ポリエチレン（低密度）
2051022        ポリエチレン（高密度）
2051023        ポリスチレン
2051024        ポリプロピレン
2051025        塩化ビニル樹脂
2051031        高機能性樹脂
2051099        その他の合成樹脂
2061011        レーヨン・アセテート
2061012        合成繊維
2071011        医薬品
2081011        油脂加工製品
2081012        石けん・合成洗剤
2081013        界面活性剤（石けん・合成洗剤を除く。）
2082011        化粧品・歯磨
2083011        塗料
2083021        印刷インキ
2084011        農薬
2089011        ゼラチン・接着剤
2089021        写真感光材料
2089091        触媒
2089099        他に分類されない化学最終製品
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
2221011        タイヤ・チューブ
2229091        ゴム製・プラスチック製履物
2229099        他に分類されないゴム製品
2311011        革製履物
2312011        製革・毛皮
2312012        かばん・袋物・その他の革製品
2511011        板ガラス
2511012        安全ガラス・複層ガラス
2511021        ガラス繊維・同製品
2511091        ガラス製加工素材
2511099        他に分類されないガラス製品
2521011        セメント
2521021        生コンクリート
2521031        セメント製品
2531011        建設用陶磁器
2531012        工業用陶磁器
2531013        日用陶磁器
2591011        耐火物
2591099        その他の建設用土石製品
2599011        炭素・黒鉛製品
2599021        研磨材
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
2699011        鉄鋼シャースリット業
2699099        その他の鉄鋼製品
2711011        銅
2711021        鉛・亜鉛（再生を含む。）
2711031        アルミニウム（再生を含む。）
2711099        その他の非鉄金属地金
2712011        非鉄金属屑
2721011        電線・ケーブル
2721021        光ファイバケーブル
2729011        伸銅品
2729021        アルミ圧延製品
2729031        非鉄金属素形材
2729041        核燃料
2729099        その他の非鉄金属製品
2811011        建設用金属製品
2812011        建築用金属製品
2891011        ガス・石油機器・暖房・調理装置
2899011        ボルト・ナット・リベット・スプリング
2899021        金属製容器・製缶板金製品
2899031        配管工事附属品
2899032        粉末や金製品
2899033        刃物・道具類
2899091        金属プレス製品
2899092        金属線製品
2899099        他に分類されない金属製品
2911011        ボイラ
2911021        タービン
2911031        原動機
2912011        ポンプ・圧縮機
2913011        運搬機械
2914011        冷凍機・温湿調整装置
2919011        ベアリング
2919091        動力伝導装置
2919099        他に分類されないはん用機械
3011011        農業用機械
3012011        建設・鉱山機械
3013011        繊維機械
3014011        食品機械・同装置
3014012        木材加工機械
3014013        パルプ装置・製紙機械
3014014        印刷・製本・紙工機械
3014015        包装・荷造機械
3015011        化学機械
3015021        鋳造装置
3015022        プラスチック加工機械
3016011        金属工作機械
3016021        金属加工機械
3016031        機械工具
3017011        半導体製造装置
3019011        金型
3019021        真空装置・真空機器
3019031        ロボット
3019099        その他の生産用機械
3111011        複写機
3111099        その他の事務用機械
3112011        自動販売機
3112012        娯楽用機器
3112019        その他のサービス用機器
3113011        計測機器
3114011        医療用機械器具
3115011        光学機械・レンズ
3116011        武器
3211011        半導体素子
3211021        集積回路
3211031        液晶パネル
3211041        フラットパネル・電子管
3299011        記録メディア
3299021        電子回路
3299099        その他の電子部品
3311011        発電機器
3311012        電動機
3311021        変圧器・変成器
3311031        開閉制御装置・配電盤
3311041        配線器具
3311051        内燃機関電装品
3311099        その他の産業用電気機器
3321011        民生用エアコンディショナ
3321021        民生用電気機器（エアコンを除く。）
3331011        電子応用装置
3332011        電気計測器
3399011        電球類
3399021        電気照明器具
3399031        電池
3399099        その他の電気機械器具
3411011        有線電気通信機器
3411021        携帯電話機
3411031        無線電気通信機器（携帯電話機を除く。）
3411041        ラジオ・テレビ受信機
3411099        その他の電気通信機器
3412011        ビデオ機器・デジタルカメラ
3412021        電気音響機器
3421011        パーソナルコンピュータ
3421021        電子計算機本体（パソコンを除く。）
3421031        電子計算機附属装置
3511011        乗用車
3521011        トラック・バス・その他の自動車
3522011        二輪自動車
3531011        自動車用内燃機関
3531021        自動車部品
3541011        鋼船
3541021        その他の船舶
3541031        舶用内燃機関
3541101        船舶修理
3591011        鉄道車両
3591101        鉄道車両修理
3592011        航空機
3592101        航空機修理
3599011        自転車
3599091        産業用運搬車両
3599099        他に分類されない輸送機械
3911011        がん具
3911021        運動用品
3919011        身辺細貨品
3919021        時計
3919031        楽器
3919041        筆記具・文具
3919051        畳・わら加工品
3919061        情報記録物
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
4191011        鉄道軌道建設
4191021        電力施設建設
4191031        電気通信施設建設
4191099        その他の土木建設
4611001        事業用電力
4611031        自家発電
4621011        都市ガス
4622011        熱供給業
4711011        上水道・簡易水道
4711021        工業用水
4711031        下水道★★
4811011        廃棄物処理（公営）★★
4811021        廃棄物処理
5111011        卸売
5112011        小売
5311011        公的金融（ＦＩＳＩＭ）
5311012        民間金融（ＦＩＳＩＭ）
5311013        公的金融（手数料）
5311014        民間金融（手数料）
5312011        生命保険
5312021        損害保険
5511011        不動産仲介・管理業
5511021        不動産賃貸業
5521011        住宅賃貸料
5531011        住宅賃貸料（帰属家賃）
5711011        鉄道旅客輸送
5712011        鉄道貨物輸送
5721011        バス
5721021        ハイヤー・タクシー
5722011        道路貨物輸送（自家輸送を除く。）
5731011        自家輸送（旅客自動車）
5732011        自家輸送（貨物自動車）
5741011        外洋輸送
5742011        沿海・内水面旅客輸送
5742012        沿海・内水面貨物輸送
5743011        港湾運送
5751011        国際航空輸送
5751012        国内航空旅客輸送
5751013        国内航空貨物輸送
5751014        航空機使用事業
5761011        貨物利用運送
5771011        倉庫
5781011        こん包
5789011        道路輸送施設提供
5789021        水運施設管理（国公営）★★
5789031        水運施設管理
5789041        水運附帯サービス
5789051        航空施設管理（公営）★★
5789061        航空施設管理
5789071        航空附帯サービス
5789099        旅行・その他の運輸附帯サービス
5791011        郵便・信書便
5911011        固定電気通信
5911021        移動電気通信
5911031        電気通信に附帯するサービス
5921011        公共放送
5921021        民間放送
5921031        有線放送
5931011        ソフトウェア業
5931012        情報処理・提供サービス
5941011        インターネット附随サービス
5951011        映像・音声・文字情報制作（新聞・出版を除く。）
5951021        新聞
5951031        出版
6111011        公務（中央）★★
6112011        公務（地方）★★
6311011        学校教育（国公立）★★
6311021        学校教育（私立）★
6311031        学校給食（国公立）★★
6311041        学校給食（私立）★
6312011        社会教育（国公立）★★
6312021        社会教育（非営利）★
6312031        その他の教育訓練機関（国公立）★★
6312041        その他の教育訓練機関
6321011        自然科学研究機関（国公立）★★
6321021        人文・社会科学研究機関（国公立）★★
6321031        自然科学研究機関（非営利）★
6321041        人文・社会科学研究機関（非営利）★
6321051        自然科学研究機関
6321061        人文・社会科学研究機関
6322011        企業内研究開発
6411011        医療（入院診療）
6411021        医療（入院外診療）
6411031        医療（歯科診療）
6411041        医療（調剤）
6411051        医療（その他の医療サービス）
6421011        保健衛生（国公立）★★
6421021        保健衛生
6431011        社会保険事業★★
6431021        社会福祉（国公立）★★
6431031        社会福祉（非営利）★
6431041        社会福祉
6431051        保育所
6441011        介護（施設サービス）
6441021        介護（施設サービスを除く。）
6599011        会員制企業団体
6599021        対家計民間非営利団体（別掲を除く。）★
6611011        産業用機械器具（建設機械器具を除く。）賃貸業
6611012        建設機械器具賃貸業
6611013        電子計算機・同関連機器賃貸業
6611014        事務用機械器具（電算機等を除く。）賃貸業
6611015        スポーツ・娯楽用品・その他の物品賃貸業
6612011        貸自動車業
6621011        テレビ・ラジオ広告
6621012        新聞・雑誌・その他の広告
6631101        自動車整備
6632101        機械修理
6699011        法務・財務・会計サービス
6699021        土木建築サービス
6699031        労働者派遣サービス
6699041        建物サービス
6699051        警備業
6699099        その他の対事業所サービス
6711011        宿泊業
6721011        飲食店
6721021        持ち帰り・配達飲食サービス
6731011        洗濯業
6731021        理容業
6731031        美容業
6731041        浴場業
6731099        その他の洗濯・理容・美容・浴場業
6741011        映画館
6741021        興行場（映画館を除く。）・興行団
6741031        競輪・競馬等の競走場・競技団
6741041        スポーツ施設提供業・公園・遊園地
6741051        遊戯場
6741099        その他の娯楽
6799011        写真業
6799021        冠婚葬祭業
6799031        個人教授業
6799041        各種修理業（別掲を除く。）
6799099        その他の対個人サービス
6811000         事務用品
6911000        分類不明
7000000        内生部門計
7111001        宿泊・日当
7111002        交際費
7111003        福利厚生費
9111000        賃金・俸給
9112000        社会保険料（雇用主負担）
9113000        その他の給与及び手当
9211000        営業余剰
9311000        資本減耗引当
9321000        資本減耗引当（社会資本等減耗分）
9411000        間接税（関税・輸入品商品税を除く。）
9511000        （控除）経常補助金
9600000        粗付加価値部門計
9700000        国内生産額
/;
set row_st(row_bas) "行部門 (合計等)" /
7000000        内生部門計
9600000        粗付加価値部門計
9700000        国内生産額
/;
set row_va(row_bas) "付加価値部門 (基本分類)" /
7111001        宿泊・日当
7111002        交際費
7111003        福利厚生費
9111000        賃金・俸給
9112000        社会保険料（雇用主負担）
9113000        その他の給与及び手当
9211000        営業余剰
9311000        資本減耗引当
9321000        資本減耗引当（社会資本等減耗分）
9411000        間接税（関税・輸入品商品税を除く。）
9511000        （控除）経常補助金
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
012102        肉用牛
012103        豚
012104        鶏卵
012105        肉鶏
012109        その他の畜産
013101        獣医業
013102        農業サービス（獣医業を除く。）
015101        育林
015201        素材
015301        特用林産物（狩猟業を含む。）
017101        海面漁業
017102        海面養殖業
017201        内水面漁業
017202        内水面養殖業
061101        石炭・原油・天然ガス
062101        砂利・採石
062102        砕石
062909        その他の鉱物
111101        食肉
111102        酪農品
111109        その他の畜産食料品
111201        冷凍魚介類
111202        塩・干・くん製品
111203        水産びん・かん詰
111204        ねり製品
111209        その他の水産食料品
111301        精穀
111302        製粉
111401        めん類
111402        パン類
111403        菓子類
111501        農産保存食料品
111601        砂糖
111602        でん粉
111603        ぶどう糖・水あめ・異性化糖
111604        動植物油脂
111605        調味料
111901        冷凍調理食品
111902        レトルト食品
111903        そう菜・すし・弁当
111909        その他の食料品
112101        清酒
112102        ビール類
112103        ウイスキー類
112109        その他の酒類
112901        茶・コーヒー
112902        清涼飲料
112903        製氷
113101        飼料
113102        有機質肥料（別掲を除く。）
114101        たばこ
151101        紡績糸
151201        綿・スフ織物（合繊短繊維織物を含む。）
151202        絹・人絹織物（合繊長繊維織物を含む。）
151209        その他の織物
151301        ニット生地
151401        染色整理
151909        その他の繊維工業製品
152101        織物製衣服
152102        ニット製衣服
152209        その他の衣服・身の回り品
152901        寝具
152902        じゅうたん・床敷物
152909        その他の繊維既製品
161101        製材
161102        合板・集成材
161103        木材チップ
161909        その他の木製品
162101        木製家具
162102        金属製家具
162103        木製建具
162109        その他の家具・装備品
163101        パルプ
163201        洋紙・和紙
163202        板紙
163301        段ボール
163302        塗工紙・建設用加工紙
164101        段ボール箱
164109        その他の紙製容器
164901        紙製衛生材料・用品
164909        その他のパルプ・紙・紙加工品
191101        印刷・製版・製本
201101        化学肥料
202101        ソーダ工業製品
202901        無機顔料
202902        圧縮ガス・液化ガス
202903        塩
202909        その他の無機化学工業製品
203101        石油化学基礎製品
203102        石油化学系芳香族製品
204101        脂肪族中間物
204102        環式中間物・合成染料・有機顔料
204201        合成ゴム
204901        メタン誘導品
204902        可塑剤
204909        その他の有機化学工業製品
205101        熱硬化性樹脂
205102        熱可塑性樹脂
205103        高機能性樹脂
205109        その他の合成樹脂
206101        化学繊維
207101        医薬品
208101        油脂加工製品・界面活性剤
208201        化粧品・歯磨
208301        塗料
208302        印刷インキ
208401        農薬
208901        ゼラチン・接着剤
208902        写真感光材料
208909        その他の化学最終製品
211101        石油製品
212101        石炭製品
212102        舗装材料
221101        プラスチック製品
222101        タイヤ・チューブ
222909        その他のゴム製品
231101        革製履物
231201        なめし革・革製品・毛皮（革製履物を除く。）
251101        板ガラス・安全ガラス
251102        ガラス繊維・同製品
251109        その他のガラス製品
252101        セメント
252102        生コンクリート
252103        セメント製品
253101        陶磁器
259101        耐火物
259109        その他の建設用土石製品
259901        炭素・黒鉛製品
259902        研磨材
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
263103        鋳鉄品・鍛工品（鉄）
269901        鉄鋼シャースリット業
269909        その他の鉄鋼製品
271101        銅
271102        鉛・亜鉛（再生を含む。）
271103        アルミニウム（再生を含む。）
271109        その他の非鉄金属地金
272101        電線・ケーブル
272102        光ファイバケーブル
272901        伸銅品
272902        アルミ圧延製品
272903        非鉄金属素形材
272904        核燃料
272909        その他の非鉄金属製品
281101        建設用金属製品
281201        建築用金属製品
289101        ガス・石油機器・暖房・調理装置
289901        ボルト・ナット・リベット・スプリング
289902        金属製容器・製缶板金製品
289903        配管工事附属品・粉末や金製品・道具類
289909        その他の金属製品
291101        ボイラ
291102        タービン
291103        原動機
291201        ポンプ・圧縮機
291301        運搬機械
291401        冷凍機・温湿調整装置
291901        ベアリング
291909        その他のはん用機械
301101        農業用機械
301201        建設・鉱山機械
301301        繊維機械
301401        生活関連産業用機械
301501        化学機械
301502        鋳造装置・プラスチック加工機械
301601        金属工作機械
301602        金属加工機械
301603        機械工具
301701        半導体製造装置
301901        金型
301902        真空装置・真空機器
301903        ロボット
301909        その他の生産用機械
311101        複写機
311109        その他の事務用機械
311201        サービス用・娯楽用機器
311301        計測機器
311401        医療用機械器具
311501        光学機械・レンズ
311601        武器
321101        半導体素子
321102        集積回路
321103        液晶パネル
321104        フラットパネル・電子管
329901        記録メディア
329902        電子回路
329909        その他の電子部品
331101        回転電気機械
331102        変圧器・変成器
331103        開閉制御装置・配電盤
331104        配線器具
331105        内燃機関電装品
331109        その他の産業用電気機器
332101        民生用エアコンディショナ
332102        民生用電気機器（エアコンを除く。）
333101        電子応用装置
333201        電気計測器
339901        電球類
339902        電気照明器具
339903        電池
339909        その他の電気機械器具
341101        有線電気通信機器
341102        携帯電話機
341103        無線電気通信機器（携帯電話機を除く。）
341104        ラジオ・テレビ受信機
341109        その他の電気通信機器
341201        ビデオ機器・デジタルカメラ
341202        電気音響機器
342101        パーソナルコンピュータ
342102        電子計算機本体（パソコンを除く。）
342103        電子計算機附属装置
351101        乗用車
352101        トラック・バス・その他の自動車
352201        二輪自動車
353101        自動車用内燃機関
353102        自動車部品
354101        鋼船
354102        その他の船舶
354103        舶用内燃機関
354110        船舶修理
359101        鉄道車両
359110        鉄道車両修理
359201        航空機
359210        航空機修理
359901        自転車
359909        その他の輸送機械
391101        がん具
391102        運動用品
391901        身辺細貨品
391902        時計
391903        楽器
391904        筆記具・文具
391905        畳・わら加工品
391906        情報記録物
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
419101        鉄道軌道建設
419102        電力施設建設
419103        電気通信施設建設
419109        その他の土木建設
461101        事業用火力発電
461102        事業用発電（火力発電を除く。）
461103        自家発電
462101        都市ガス
462201        熱供給業
471101        上水道・簡易水道
471102        工業用水
471103        下水道★★
481101        廃棄物処理（公営）★★
481102        廃棄物処理
511101        卸売
511201        小売
531101        金融
531201        生命保険
531202        損害保険
551101        不動産仲介・管理業
551102        不動産賃貸業
552101        住宅賃貸料
553101        住宅賃貸料（帰属家賃）
571101        鉄道旅客輸送
571201        鉄道貨物輸送
572101        バス
572102        ハイヤー・タクシー
572201        道路貨物輸送（自家輸送を除く。）
573101        自家輸送（旅客自動車）
573201        自家輸送（貨物自動車）
574101        外洋輸送
574201        沿海・内水面輸送
574301        港湾運送
575101        航空輸送
576101        貨物利用運送
577101        倉庫
578101        こん包
578901        道路輸送施設提供
578902        水運施設管理（国公営）★★
578903        水運施設管理
578904        水運附帯サービス
578905        航空施設管理（公営）★★
578906        航空施設管理
578907        航空附帯サービス
578909        旅行・その他の運輸附帯サービス
579101        郵便・信書便
591101        固定電気通信
591102        移動電気通信
591103        電気通信に附帯するサービス
592101        公共放送
592102        民間放送
592103        有線放送
593101        情報サービス
594101        インターネット附随サービス
595101        映像・音声・文字情報制作（新聞・出版を除く。）
595102        新聞
595103        出版
611101        公務（中央）★★
611201        公務（地方）★★
631101        学校教育（国公立）★★
631102        学校教育（私立）★
631103        学校給食（国公立）★★
631104        学校給食（私立）★
631201        社会教育（国公立）★★
631202        社会教育（非営利）★
631203        その他の教育訓練機関（国公立）★★
631204        その他の教育訓練機関
632101        自然科学研究機関（国公立）★★
632102        人文・社会科学研究機関（国公立）★★
632103        自然科学研究機関（非営利）★
632104        人文・社会科学研究機関（非営利）★
632105        自然科学研究機関
632106        人文・社会科学研究機関
632201        企業内研究開発
641101        医療（入院診療）
641102        医療（入院外診療）
641103        医療（歯科診療）
641104        医療（調剤）
641105        医療（その他の医療サービス）
642101        保健衛生（国公立）★★
642102        保健衛生
643101        社会保険事業★★
643102        社会福祉（国公立）★★
643103        社会福祉（非営利）★
643104        社会福祉
643105        保育所
644101        介護（施設サービス）
644102        介護（施設サービスを除く。）
659901        会員制企業団体
659902        対家計民間非営利団体（別掲を除く。）★
661101        物品賃貸業（貸自動車を除く。）
661201        貸自動車業
662101        広告
663110        自動車整備
663210        機械修理
669901        法務・財務・会計サービス
669902        土木建築サービス
669903        労働者派遣サービス
669904        建物サービス
669905        警備業
669909        その他の対事業所サービス
671101        宿泊業
672101        飲食店
672102        持ち帰り・配達飲食サービス
673101        洗濯業
673102        理容業
673103        美容業
673104        浴場業
673109        その他の洗濯・理容・美容・浴場業
674101        映画館
674102        興行場（映画館を除く。）・興行団
674103        競輪・競馬等の競走場・競技団
674104        スポーツ施設提供業・公園・遊園地
674105        遊戯場
674109        その他の娯楽
679901        写真業
679902        冠婚葬祭業
679903        個人教授業
679904        各種修理業（別掲を除く。）
679909        その他の対個人サービス
681100        事務用品
691100        分類不明
700000        内生部門計
711100        家計外消費支出（列）
721100        家計消費支出
721200        対家計民間非営利団体消費支出
731101        中央政府集合的消費支出
731102        地方政府集合的消費支出
731103        中央政府個別的消費支出
731104        地方政府個別的消費支出
732101        中央政府集合的消費支出（社会資本等減耗分）
732102        地方政府集合的消費支出（社会資本等減耗分）
732103        中央政府個別的消費支出（社会資本等減耗分）
732104        地方政府個別的消費支出（社会資本等減耗分）
741100        国内総固定資本形成（公的）
751100        国内総固定資本形成（民間）
761101        生産者製品在庫純増
761102        半製品・仕掛品在庫純増
761103        流通在庫純増
761104        原材料在庫純増
780000        国内最終需要計
790000        国内需要合計
801101        輸出（普通貿易）
801102        輸出（特殊貿易）
801200        輸出（直接購入）
810000        輸出計
820000        最終需要計
830000        需要合計
841101        （控除）輸入（普通貿易）
841102        （控除）輸入（特殊貿易）
841200        （控除）輸入（直接購入）
851100        （控除）関税
861100        （控除）輸入品商品税
870000        （控除）輸入計
880000        最終需要部門計
891100        商業マージン（卸売）
891200        商業マージン（小売）
901100        貨物運賃（鉄道）
901200        貨物運賃（道路）
901301        貨物運賃（沿海内水面）
901302        貨物運賃（港湾運送）
901400        貨物運賃（航空）
901500        貨物運賃（利用運送）
901600        貨物運賃（倉庫）
970000        国内生産額
/;
set col_st(col_bas) "列部門 (合計等)" /
700000        内生部門計
780000        国内最終需要計
790000        国内需要合計
810000        輸出計
820000        最終需要計
830000        需要合計
870000        （控除）輸入計
880000        最終需要部門計
970000        国内生産額
/;
set col_fd(col_bas) "最終需要部門 (基本分類)" /
711100        家計外消費支出（列）
721100        家計消費支出
721200        対家計民間非営利団体消費支出
731101        中央政府集合的消費支出
731102        地方政府集合的消費支出
731103        中央政府個別的消費支出
731104        地方政府個別的消費支出
732101        中央政府集合的消費支出（社会資本等減耗分）
732102        地方政府集合的消費支出（社会資本等減耗分）
732103        中央政府個別的消費支出（社会資本等減耗分）
732104        地方政府個別的消費支出（社会資本等減耗分）
741100        国内総固定資本形成（公的）
751100        国内総固定資本形成（民間）
761101        生産者製品在庫純増
761102        半製品・仕掛品在庫純増
761103        流通在庫純増
761104        原材料在庫純増
801101        輸出（普通貿易）
801102        輸出（特殊貿易）
801200        輸出（直接購入）
/;
set col_fd_imp(col_bas) "最終需要部門 (基本分類) 輸入も含む" /
711100        家計外消費支出（列）
721100        家計消費支出
721200        対家計民間非営利団体消費支出
731101        中央政府集合的消費支出
731102        地方政府集合的消費支出
731103        中央政府個別的消費支出
731104        地方政府個別的消費支出
732101        中央政府集合的消費支出（社会資本等減耗分）
732102        地方政府集合的消費支出（社会資本等減耗分）
732103        中央政府個別的消費支出（社会資本等減耗分）
732104        地方政府個別的消費支出（社会資本等減耗分）
741100        国内総固定資本形成（公的）
751100        国内総固定資本形成（民間）
761101        生産者製品在庫純増
761102        半製品・仕掛品在庫純増
761103        流通在庫純増
761104        原材料在庫純増
801101        輸出（普通貿易）
801102        輸出（特殊貿易）
801200        輸出（直接購入）
841101        （控除）輸入（普通貿易）
841102        （控除）輸入（特殊貿易）
841200        （控除）輸入（直接購入）
851100        （控除）関税
861100        （控除）輸入品商品税
/;
set col_fd_(col_bas) "最終需要部門 (基本分類) 輸出を除く" /
711100        家計外消費支出（列）
721100        家計消費支出
721200        対家計民間非営利団体消費支出
731101        中央政府集合的消費支出
731102        地方政府集合的消費支出
731103        中央政府個別的消費支出
731104        地方政府個別的消費支出
732101        中央政府集合的消費支出（社会資本等減耗分）
732102        地方政府集合的消費支出（社会資本等減耗分）
732103        中央政府個別的消費支出（社会資本等減耗分）
732104        地方政府個別的消費支出（社会資本等減耗分）
741100        国内総固定資本形成（公的）
751100        国内総固定資本形成（民間）
761101        生産者製品在庫純増
761102        半製品・仕掛品在庫純増
761103        流通在庫純増
761104        原材料在庫純増
/;
set col_exp(col_bas) "最終需要部門 (輸出関連)" /
801101        輸出（普通貿易）
801102        輸出（特殊貿易）
801200        輸出（直接購入）
/;
set col_imp(col_bas) "最終需要 (輸入関連)" /
841101        （控除）輸入（普通貿易）
841102        （控除）輸入（特殊貿易）
841200        （控除）輸入（直接購入）
851100        （控除）関税
861100        （控除）輸入品商品税
/;
set col_mar(col_bas) "国内マージン・運賃" /
891100        商業マージン（卸売）
891200        商業マージン（小売）
901100        貨物運賃（鉄道）
901200        貨物運賃（道路）
901301        貨物運賃（沿海内水面）
901302        貨物運賃（港湾運送）
901400        貨物運賃（航空）
901500        貨物運賃（利用運送）
901600        貨物運賃（倉庫）
/;
set col_ind(col_bas)    "列内生部門 (基本分類)";
col_ind(col_bas)=yes;
col_ind(col_bas)$col_st(col_bas)=no;
col_ind(col_bas)$col_fd(col_bas)=no;
col_ind(col_bas)$col_imp(col_bas)=no;
col_ind(col_bas)$col_mar(col_bas)=no;


* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:

