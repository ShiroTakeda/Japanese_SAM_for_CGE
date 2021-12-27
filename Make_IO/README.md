<!--
Filename:       README.md
Author:         Shiro Takeda
e-mail          <shiro.takeda@gmail.com>
First-written:  <2020-11-29>
Time-stamp:     <2021-12-27 21:15:21 st>
-->

Make_IO フォルダについて説明
==============================

## 概要

このフォルダのプログラムでは以下のことをおこないます。

+ 元の産業連関表のデータ、3EIDデータを GAMS で利用しやすい用に加工
+ 元の財・部門の統合

## 手順

以下の手順でプログラムを実行します。

+ ステップ1: `run_covert_io_table.gms` を実行
+ ステップ2: `run_make_io.gms` を実行
+ ステップ3: `run_make_3EID.gms` を実行

この後、データの統合をします。それには

+ ステップ4: `run_aggr.gms` を実行

そして、統合されたデータのチェックをします。

+ ステップ5: `run_check_aggr_data.gms` を実行

以下、各ステップをもう少し詳しく説明します。


### ステップ1 (run_convert_io_table.gms)

これで Excel ファイルに入っている産業連関表データを GAMS が扱いやすい GDX ファイ
ルに変換します。ファイルの中で souce_data フォルダの`convert_io_table.gms` を実
行しています。2015年、2011年、2005年の 3 つのデータを変換しています。

この結果、source_data フォルダに `original_io_XXXX.gdx` というような名前（XXXXの
ところは年）の GDX ファイルが作成されます。


### ステップ2 (run_make_io.gms)

ここでステップ1で作成したIO表のファイルからデータを読み込み、CGE分析で利用しやす
い用に加工をします。

+ 注: 加工といってもデータの数値を変えているわけではなく、形式の変更をしているだ
  けです。
  
この中で source_data フォルダの `make_io.gms` を実行しています。

    $call gams .\source_data_\make_io.gms --year=2015
    
というような形式で実行します。
  
    --year=XXXX
      
 の部分で何年のデータかを指定します。2005、2011、2015の3年分のデータがあり、3年
 分全て実行します。
 
 この結果、`japan_io_2015.gdx`、`japan_io_2011.gdx`、`japan_io_2005.gdx` という3
つのファイルが data フォルダに作成されます。

  
### ステップ3 (run_make_3EID.gms)

ここで3EIDデータを Excel ファイルから読み込み、産業連関表のデータに合うように加
工します。

この中で、

    $call gams .\source_data\make_3eid_2015.gms
    $call gams .\source_data\make_3eid_2011.gms
    $call gams .\source_data\make_3eid_2005.gms
    
のように3つのプログラム（make_3eid_2015.gms など）を実行しています。それぞれ
2015年、2011年、2005年のデータ用です。

この結果、`japan_io_2015_co2.gdx`、`japan_io_2011_co2.gdx`、
`japan_io_2005_co2.gdx` という3つのファイルが data フォルダに作成されます。


### ステップ4: 部門の統合（run_aggr.gms）

ここまでのデータでは元の産業連関表の部門分類のままになっています。ここではその部
門分類を統合します。

統合するためには以下の二つのファイルが必要になります。

+ 統合後の部門分類を定義したファイル
+ 元の分類と統合後の分類の対応を指定するファイル

前者は拡張子を「set」とするので以下では set ファイルと呼びます。同様に、後者のファ
イルは拡張子を「map」とするので以下では map ファイルと呼びます。

set ファイル、map ファイルはともに set フォルダに置いてください。

例えば、2011年のデータを 26財、18部門に統合するための set ファイル、map ファイル
をそれぞれ `japan_2011_26x18.set`、`japan_2011_26x18.set`という名前で作成した場
合には、

    $call gams aggr --year=2011 --set_name=japan_2011_26x18

のように実行します。

これを実行すると、統合したデータが aggr_data フォルダの `japan_2011_26x18.gdx`
というファイルに出力されます。


#### set ファイルの設定

set ファイルでは以下の4つの set を指定します。

+ row: これは統合後の行部門（財）の set。
+ col: これは統合後の列部門（部門）の set。

このうち「row」、「col」を自分の望む部門統合に従い指定してください。

row と col に加え以下の二つの set も定義されています。

+ va: これは統合後の付加価値部門の set。
+ fd: これは統合後の最終需要部門の set。

この二つは自分では変更しないでください。


#### map ファイルの設定

map ファイルのん名前は拡張子以外は set ファイルと同じにします。例えば、set ファ
イルが `japan_2015_15x12.set` なら map ファイルは`japan_2015_15x12.map` とします。

map ファイルでは

+ row_map: これは行部門（財）の対応を指定する set
+ col_map: これは列部門（部門）の対応を指定する set

の二つを指定します。


### ステップ5: 統合したデータのチェック（run_check_aggr_data.gms）

run_check_aggr_data.gms を実行すると、統合したデータのチェックをするための Excel ファ
イルを出力します。

例えば、上の例で作成した `japan_2011_26x18.gdx` というファイルのデータをチェックするのなら、

    $call gams check_aggr_data --set_name=japan_2011_26x18

を実行します。すると、check_data フォルダに `check_japan_2011_26x18.xlsx` という
ファイルが作成されます。







<!--
--------------------
Local Variables:
mode: markdown
fill-column: 80
coding: utf-8-dos
End:
-->

