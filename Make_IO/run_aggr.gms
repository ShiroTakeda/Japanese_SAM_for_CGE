$title データ（財・部門）の統合をおこなうプログラム
$ontext

First-written: <2020-12-04>

これはデータ（財・部門）の統合をおこなうプログラムです。以下のように記述します。

        $call gams aggr --year=XXX --set_name=SET_NAME

データの統合には aggr.gms というプログラムを利用します。

XXXX の部分は年の指定です。SET_NAME の部分は統合後の部門分類、部門の対応表を定義
するファイルの名前です。

このプログラムを実行するには set フォルダに以下の二つのファイルを準備する必要が
あります。

SET_NAME.set: これは財・部門統合後の財・部門名を指定するファイルです。
SET_NAME.map: これは統合前の分類と統合後の分類の対応を指定するファイルです。

set フォルダに多数のサンプルのファイルがあるので、それを参考にしてください。

例：例えば、

        $call gams aggr --year=2011 --set_name=japan_2011_26x18

を実行すると、aggr_data フォルダの japan_2011_26x18.gdx というファイルに統合され
たデータが出力されます。

$offtext

*       2015年のデータ用
* $call gams aggr --year=2015 --set_name=japan_2015_13x13_std
* $call gams aggr --year=2015 --set_name=japan_2015_37x37_std
* $call gams aggr --year=2015 --set_name=japan_2015_185x185_std
* $call gams aggr --year=2015 --set_name=japan_2015_basic_std

*       2011年のデータ用
* $call gams aggr --year=2011 --set_name=japan_2011_13x13_std
* $call gams aggr --year=2011 --set_name=japan_2011_37x37_std
* $call gams aggr --year=2011 --set_name=japan_2011_188x188_std
* $call gams aggr --year=2011 --set_name=japan_2011_basic_std

$call gams aggr --year=2011 --set_name=japan_2011_26x18

*       2005年のデータ用
* $call gams aggr --year=2005 --set_name=japan_2005_13x13_std
* $call gams aggr --year=2005 --set_name=japan_2005_34x34_std
* $call gams aggr --year=2005 --set_name=japan_2005_188x188_std
* $call gams aggr --year=2005 --set_name=japan_2005_basic_std



* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:




