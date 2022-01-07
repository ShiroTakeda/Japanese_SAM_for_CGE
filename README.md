応用一般均衡分析用の日本の SAM の作成
==============================

## このパッケージ（プログラム群）の概要

+ ここでの「SAM」とは「社会会計表（social accounting matrix）」のことです。
+ これは日本を対象とした応用一般均衡分析（computable general equilibrium
  analysis、以下 CGE分析）用の SAM データを作成するためのパッケージです。


### 注1

+ データ自体を作成・提供するわけではなく、単に既存のデータをCGE分析で利用しやす
  いように加工するためのパッケージです。
+ 元になるデータとしては、以下の2つを利用させてもらっています。
  + 総務省が作成する日本の産業連関表: 2015年版、2011年版、2005年版．
  + 3EIDデータによるCO2排出量: 2015年版、2011年版、2005年版．
+ データはあくまで以上の二つのデータになります。この二つのデータは別の機関・人が
  作成してくれているデータですので、別の場所で配布されています。下に配布場所を記
  載しています。

### 注2

+ このパッケージに入っているものは基本的に MS Windows 用のものです。これについて
  は下の「パッケージの動作環境について」についてを見てください。


## パッケージの構造

| ディレクトリ         | 説明                                                       |
|:---------------------|:-----------------------------------------------------------|
| [Make_IO](Make_IO)   | ここでSAMの基になるIO表の作成をおこないます。              |
| [Make_SAM](Make_SAM) | このフォルダで、Make_IOで作成したIO表からSAMを作成します。 |

最初に Make_IO でデータを作成し、それを Make_SAM で使います。詳しくは各ディレク
トリ（フォルダ）内の README.md ファイルを見てください。
  


## 元データの提供場所

### 総務省の産業連関表

産業連関表は以下の場所から入手できます。

+ https://www.soumu.go.jp/toukei_toukatsu/data/io/index.htm

#### データ

https://www.soumu.go.jp/toukei_toukatsu/data/io/ichiran.htm

+ 2015年表: 総務省，平成27年（2015年）産業連関表．
+ 2011年表: 総務省，平成23年（2011年）産業連関表．
+ 2005年表: 総務省，平成17年（2005年）産業連関表．

#### 解説書

+ 総務省（2020）『平成27年（2015年）産業連関表－総合解説編－』，
  https://www.soumu.go.jp/toukei_toukatsu/data/io/015index.html
+ 総務省（2015）『平成23年（2011年）産業連関表－総合解説編－』，
  https://www.soumu.go.jp/toukei_toukatsu/data/io/011index.htm
+ 総務省（2009）『平成17年（2005年）産業連関表－総合解説編－』，
  https://www.soumu.go.jp/toukei_toukatsu/data/io/005index.htm


### 3EIDデータ

国立環境研究所・地球環境研究センター

http://www.cger.nies.go.jp/publications/report/d031/jpn/index_j.htm

#### データ

http://www.cger.nies.go.jp/publications/report/d031/jpn/datafile/index.htm


## パッケージの動作環境について

このパッケージは次の二つから構成されます。

1) Make_IO フォルダのプログラム
  + こちらは産業連関表（と 3EID データ）から CGE 分析で利用しやすい形の産業連関
    表データを作成するためのプログラムです。
  + 主に GAMS のプログラムから構成されます。
2) Make_SAM フォルダのプログラム
  + こちらは 1 で作成したデータから SAM を作成するためのものです。
  + Excel 上で動作する VBA（マクロ） のプログラムです。
  
2 のプログラムは Excel の VBA なので、Excel の VBA が動くならどこでも動きます。

1 では、大元の産業連関表と 3EID のデータを Excel ファイルという形式に保持してお
り、gdxxrw を利用して Excel ファイルのデータを GDX ファイルに出力するという手順
をとっています。gdxxrw は Windows でしか動作しないので、ここは Mac などでは動作
しません。

データを一度 GDX ファイルに出力した後の部分は Mac でも利用できると思います（デー
タを統合した後に Excel に出力する部分は動作しませんが）。
  



<!--
--------------------
Local Variables:
mode: markdown
fill-column: 80
coding: utf-8-dos
End:
-->

