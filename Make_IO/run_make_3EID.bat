REM
REM	First-written:      <2020-12-04>
REM
REM	このファイルでは 3EID データを加工するプログラムを実行。
REM
REM	gams make_3eid_XXXX
REM
REM	XXXX の部分は年の指定です。年毎に別のプログラムを実行する形になっています。
REM
REM	make_3eid_2015.gms などは source_data フォルダにあります。
REM

REM	まず、source_data ディレクトリに移動する。
cd .\source_data

REM	以下で実行
call gams make_3eid_2015
call gams make_3eid_2011
call gams make_3eid_2005

pause

