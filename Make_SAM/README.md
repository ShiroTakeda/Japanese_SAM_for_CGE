CGE分析用の日本のSAMの作成
==============================

# 注

ここにある SAM 作成用の VBA マクロを利用するには、統合したデータにおける付加価値
部門、最終需要部門が以下のような分類になっていなければいけない。

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









<!--
--------------------
Local Variables:
mode: markdown
fill-column: 80
coding: utf-8-dos
End:
-->

