<!--
Filename:       README.md
Author:         Shiro Takeda
e-mail          <shiro.takeda@gmail.com>
First-written:  <2020-11-29>
Time-stamp:     <2022-05-21 15:53:32 st>
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

ここまではそのまま3つの gms ファイルを実行するだけです。この後、データの統合（部
門・財の統合）をおこないますが、それには自分で設定ファイルを作成したり、プログラ
ムを書き換えたりする必要があります。

データの統合には自分が望む部門・財の分類に合わせた設定ファイルを作成した上で以下
を実行します。

+ ステップ4: 自分で修正した上で `run_aggr.gms` を実行



とりあえず、サンプルの設定ファイルを使うということでかまわなければ、
`run_covert_io_table.gms` から `run_aggr.gms` までそのまま順番に実行してみてくだ
さい。そうすると、

+ aggr_data フォルダに `japan_2011_26x18.gdx`
+ data_check フォルダに `japan_2011_26x18.xlsx` 

というファイルが出力されます。前者が統合されたデータが入った GDX ファイル、後者
は前者のデータ（の一部）を Excel ファイルに出力したものです。

以下で各ステップでおこなっていることをもう少し詳しく説明します。


### □ ステップ1 (run_convert_io_table.gms)

これで Excel ファイルに入っている産業連関表データを GAMS が扱いやすい GDX ファイ
ルに変換します。ファイルの中で souce_data フォルダの`convert_io_table.gms` を実
行しています。2015年、2011年、2005年の 3 つのデータを変換しています。

この結果、source_data フォルダに `original_io_XXXX.gdx` というような名前（XXXXの
ところは年）の GDX ファイルが作成されます。

#### 注

+ 元の産業連関表のデータは `io_basic_2005.xlsx`、`io_basic_2011.xlsx`、
  `io_basic_2015.xlsx` に入っています。
+ ここでの Excel ファイル → GDX ファイルの部分で gdxxrw を利用しています。ここで
  は Windows でないと実行できません。


### □ ステップ2 (run_make_io.gms)

ここでステップ1で作成したIO表のファイルからデータを読み込み、CGE分析で利用しやす
い形に加工をします。

+ 注: 加工といってもデータの数値を変えているわけではなく、形式の変更をしているだ
  けです。
  
この中で source_data フォルダの `make_io.gms` を実行しています。

    $call gams .\source_data_\make_io.gms --year=2015
    
というような形式で実行します。
  
    --year=XXXX
      
の部分で何年のデータかを指定します。2005、2011、2015の3年分のデータがあり、3年分
全て実行します。
 
この結果、`japan_io_2015.gdx`、`japan_io_2011.gdx`、`japan_io_2005.gdx` という3
つのファイルが data フォルダに作成されます。

  
### □ ステップ3 (run_make_3EID.gms)

このパッケージでは産業連関表のデータに加え、3EID の CO2 データも一緖に扱います。

この部分で3EIDデータを Excel ファイルから読み込み、産業連関表のデータに合うよう
に加工します。

この中で、

    $call gams .\source_data\make_3eid_2015.gms
    $call gams .\source_data\make_3eid_2011.gms
    $call gams .\source_data\make_3eid_2005.gms
    
のように3つのプログラム（make_3eid_2015.gms など）を実行しています。それぞれ
2015年、2011年、2005年のデータ用です。

この結果、`japan_io_2015_co2.gdx`、`japan_io_2011_co2.gdx`、
`japan_io_2005_co2.gdx` という3つのファイルが data フォルダに作成されます。

#### 注

+ ここでも Excel ファイル → GDX ファイルの部分で gdxxrw を利用しています
  （Windows でないと実行できません）。


### □ ステップ4: 部門の統合（run_aggr.gms）

ここまでのデータでは元の産業連関表の部門分類のままになっています。ここではその部
門分類を統合します。

データの統合には自分でどの部門をどの部門に統合するかを指定しる必要があります。このため、以下の二つのファイルを用意する必要があります。

+ 統合後の部門分類を定義したファイル（set ファイル）
+ 元の分類と統合後の分類の対応を指定するファイル（map ファイル）

前者は拡張子を「set」とするので以下では set ファイルと呼びます。同様に、後者のファ
イルは拡張子を「map」とするので以下では map ファイルと呼びます。

+ 両者は拡張子部分を除いて同じ名前にしてください。
+ set ファイル、map ファイルはともに set フォルダに置いてください。

既にサンプルの set ファイル、map ファイルが set フォルダに含まれています。例えば、
`japan_2011_26x18.set`、`japan_2011_26x18.set` は 2011 年の産業連関表を 26 財
（26行部門）、18 部門（18 列部門）に統合するための set ファイル、map ファイルで
す。この set & map ファイルを用いてデータを統合するには、`run_aggr.gms` に以下の
ように記述して実行します。

    $call gams aggr --year=2011 --set_name=japan_2011_26x18

ここで

    --year=XXXX

の `XXXX` の部分には利用する年（2005, 2011, 2015のどれか）を指定し、

    --set_name=YYYY
    
の `YYYY` の部分には set & map ファイルの名前（拡張子を除いた部分）を指定します。

これを実行すると、統合されたデータが aggr_data フォルダの
`japan_2011_26x18.gdx`というファイルに出力され、さらに data_check フォルダの
`japan_2011_26x18.xlsx` というファイルにその中身（の一部）が出力されます。


### □ まとめ

以上で統合したデータが作成できます。CGE 分析をするのに必要なデータは GDX ファイ
ル（上の例では `japan_2011_26x18.gdx`）に含まれているので、これを使えば済んでし
まいますが、Make_SAM フォルダの方でこのデータ（`japan_2011_26x18.xlsx`）を用いて
SAM を作成します。


#### set ファイルの設定についての注

set ファイルでは以下の4つの set を指定します。

+ row: これは統合後の行部門（財）の set。
+ col: これは統合後の列部門（部門）の set。
+ va: これは統合後の付加価値部門の set。
+ fd: これは統合後の最終需要部門の set。

これらの set を自分の望む部門分類に従い指定してください。


注: 後に Make_SAM フォルダにあるプログラム（SAM を作成するプログラム）を利用した
いのでしたら、va と fd は以下のような分類にしておく必要があります。

```
set     va      付加価値部門 /
epin    "雇用者所得"
ssce    "社会保障雇主負担"
opse    "営業余剰"
depr    "資本減耗引当"
idtx    "間接税"
subs    "補助金"
/;

set     fd      最終需要部門 /
hhco    "民間消費"
gvci    "政府消費（個別）"
gvcc    "政府消費（集合）"
invp    "投資（民間）"
invg    "投資（公的）"
inve    "在庫投資"
expo    "輸出"
impo    "輸入"
imta    "関税"
imtx    "輸入品商品税"
```


#### map ファイルの設定についての注

上で述べたように map ファイルの名前は拡張子以外は set ファイルと同じにします。例
えば、set ファイルが `japan_2011_26x18.set` なら map ファイルは
`japan_2011_26x18.map` とします。

map ファイルでは

+ row_map: 行部門（財）の対応を指定する set
+ col_map: 列部門（部門）の対応を指定する set
+ va_map: 付加価値部門の対応を指定する set
+ fd_map: 最終需要部門の対応を指定する set

の 4 つを指定します。







<!--
--------------------
Local Variables:
mode: markdown
fill-column: 80
coding: utf-8-dos
End:
-->

