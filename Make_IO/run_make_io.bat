REM
REM	First-written:      <2020-12-04>
REM
REM	このファイルでは make_io プログラムを実行しています。
REM
REM	gams make_io --year=XXXX
REM
REM	--year=XXXX の XXXX の部分は年の指定です。
REM
REM	make_io.gms は source_data フォルダにあります。
REM

REM	まず source_data ディレクトリに移動する。
cd .\source_data

REM	以下で make_io.gms を実行。
call gams make_io --year=2015
call gams make_io --year=2011
call gams make_io --year=2005

pause

