$title データ（財・部門）の統合をおこなうプログラム
$ontext

First-written: <2020-12-04>

これはデータ（財・部門）の統合をおこなうプログラムです。以下のように記述します。

        $call gams aggr --year=XXX --set_name=SET_NAME

データの統合には aggr.gms というプログラムを利用します。

XXXX の部分は利用するデータの年を指定します（2005, 2011 or 2015）。SET_NAME の部
分は統合後の部門分類、部門の対応表を定義するファイル名を指定します（拡張子部分は
抜き）。

このプログラムを実行するには set フォルダに以下の二つのファイルを準備する必要が
あります。

SET_NAME.set: これは財・部門統合後の財・部門名を指定するファイルです（set ファイル）。
SET_NAME.map: これは統合前の分類と統合後の分類の対応を指定するファイルです（map ファイル）。

set フォルダに多数のサンプルのファイルがあるので、それを参考にしてください。

例：例えば、`japan_2011_26x18.set`、`japan_2011_26x18.map` は 2011 年の連関表を
26財（26行部門）、18部門（18列部門）に統合するための set & map ファイルです。こ
れを使う場合には、次のようなに命令を書きます。

        $call gams aggr --year=2011 --set_name=japan_2011_26x18

これを実行すると、aggr_data フォルダの japan_2011_26x18.gdx というファイルに統合
されたデータが出力されます。

修正なしのこのファイルを実行すると、実際に上の命令を実行することになります。試し
てみてください。

付属のサンプルの set & map ファイルを全て利用してみたい場合は、以下のプログラム
のコメントアウトを全て解除して、全部を実行してみてください。

$offtext

*       2015年のデータ用
* $call gams aggr --year=2015 --set_name=japan_2015_13x13_std
* $call gams aggr --year=2015 --set_name=japan_2015_37x37_std
* $call gams aggr --year=2015 --set_name=japan_2015_185x185_std
* $call gams aggr --year=2015 --set_name=japan_2015_basic_std
* $call gams aggr --year=2015 --set_name=japan_2015_15x12

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
* $call gams aggr --year=2005 --set_name=japan_2005_15x13
* $call gams aggr --year=2005 --set_name=japan_2005_51x42

* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:




