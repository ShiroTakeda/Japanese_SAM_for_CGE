REM
REM	First-written:      <2020-12-04>
REM
REM	これは統合したデータのチェックをおこなうためのバッチファイルです。
REM
REM		call gams check_aggr_data --set_name=SET_NAME
REM
REM 	SET_NAME の部分は統合後の財・部門分類の名前です。run_aggr.bat で指定
REM 	したものと同じもの。
REM
REM	このプログラムでは check_aggr_data.gms というファイルを実行します。
REM
REM 	注: このプログラムを実行するには、その前にデータの統合をおこなってお
REM 	く必要があります。

REM	2015年のデータ用
:: call gams check_aggr_data --set_name=japan_2015_13x13_std
call gams check_aggr_data --set_name=japan_2015_37x37_std
:: call gams check_aggr_data --set_name=japan_2015_185x185_std
:: call gams check_aggr_data --set_name=japan_2015_basic_std

REM	2011年のデータ用
:: call gams check_aggr_data --set_name=japan_2011_13x13_std
:: call gams check_aggr_data --set_name=japan_2011_37x37_std
:: call gams check_aggr_data --set_name=japan_2011_188x188_std
:: call gams check_aggr_data --set_name=japan_2011_basic_std
:: call gams check_aggr_data --set_name=japan_2011_26x18

REM	2005年のデータ用
:: call gams check_aggr_data --set_name=japan_2005_13x13_std
:: call gams check_aggr_data --set_name=japan_2005_34x34_std
:: call gams check_aggr_data --set_name=japan_2005_188x188_std
:: call gams check_aggr_data --set_name=japan_2005_basic_std

pause

