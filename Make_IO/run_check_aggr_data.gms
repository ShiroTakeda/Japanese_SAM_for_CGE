$title 統合したデータのチェックをおこなうためのプログラム
$ontext
First-written: <2020-12-04>

これは統合したデータのチェックをおこなうためのプログラムです。以下のように記述し
ます。

        $call gams check_aggr_data --set_name=SET_NAME

データのチェックには check_aggr_data.gms というファイルを利用します。

SET_NAME の部分は統合後の部門分類、部門の対応表を定義するファイルの名前です。
run_aggr.bat で指定したものと同じものを指定します。

注: このプログラムを実行するには、その前にデータの統合をおこなってお
く必要があります。

例：例えば、

        $call gams check_aggr_data --set_name=japan_2011_26x18

を実行すると、check_data フォルダの check_japan_2011_26x18.xlsx というファイル
（と check_japan_2011_26x18.gdx というファイル）が作成されます。その中でデータを
チェックするための様々な数値が計算されています。


$offtext

*       2015年のデータ用
* $call gams check_aggr_data --set_name=japan_2015_13x13_std
* $call gams check_aggr_data --set_name=japan_2015_37x37_std
* $call gams check_aggr_data --set_name=japan_2015_185x185_std
* $call gams check_aggr_data --set_name=japan_2015_basic_std

*       2011年のデータ用
* $call gams check_aggr_data --set_name=japan_2011_13x13_std
* $call gams check_aggr_data --set_name=japan_2011_37x37_std
* $call gams check_aggr_data --set_name=japan_2011_188x188_std
* $call gams check_aggr_data --set_name=japan_2011_basic_std

$call gams check_aggr_data --set_name=japan_2011_26x18

*       2005年のデータ用
* $call gams check_aggr_data --set_name=japan_2005_13x13_std
* $call gams check_aggr_data --set_name=japan_2005_34x34_std
* $call gams check_aggr_data --set_name=japan_2005_188x188_std
* $call gams check_aggr_data --set_name=japan_2005_basic_std



* --------------------
* Local Variables:
* mode: gams
* fill-column: 80
* coding: utf-8-dos
* End:


    

