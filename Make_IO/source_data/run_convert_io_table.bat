REM
REM	産業連関表と3EIDデータをGDXファイルに出力するためのプログラム
REM

: 以下は産業連関表
call gams convert_io_table.gms --year=2015
call gams convert_io_table.gms --year=2011
call gams convert_io_table.gms --year=2005
