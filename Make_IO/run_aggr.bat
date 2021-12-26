REM
REM	First-written:      <2020-12-04>
REM
REM	これはデータ（財・部門）の統合をおこなうバッチファイルです。
REM
REM		call gams aggr --year=XXX --set=SET_NAME
REM
REM	XXXX の部分は年の指定です。
REM	SET_NAME の部分は統合後の財・部門分類の名前です。
REM
REM	このプログラムでは aggr.gms というファイルを実行します。
REM
REM 	このプログラムを実行するには set フォルダに以下の二つのファイルを準備
REM 	する必要があります。
REM
REM 	SET_NAME.set: これは財・部門統合後の財・部門名を指定するファイルです。
REM	SET_NAME.map: これは統合前の分類と統合後の分類の対応を指定するファイルです。
REM

REM	2015年のデータ用
:: call gams aggr --year=2015 --set=japan_2015_13x13_std
:: call gams aggr --year=2015 --set=japan_2015_37x37_std
:: call gams aggr --year=2015 --set=japan_2015_185x185_std
:: call gams aggr --year=2015 --set=japan_2015_basic_std

REM	2011年のデータ用
:: call gams aggr --year=2011 --set=japan_2011_13x13_std
:: call gams aggr --year=2011 --set=japan_2011_37x37_std
:: call gams aggr --year=2011 --set=japan_2011_188x188_std
:: call gams aggr --year=2011 --set=japan_2011_basic_std

call gams aggr --year=2011 --set=japan_2011_26x18

REM	2005年のデータ用
:: call gams aggr --year=2005 --set=japan_2005_13x13_std
:: call gams aggr --year=2005 --set=japan_2005_34x34_std
:: call gams aggr --year=2005 --set=japan_2005_188x188_std
:: call gams aggr --year=2005 --set=japan_2005_basic_std

pause


