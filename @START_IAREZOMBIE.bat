copy .\@dayz_epoch_server\*.dll .\
@echo off
echo Starting MySQL database. Please wait 5-10 seconds.
start /D.\MySQL\ MySQL.bat
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Executing mysql script...
.\MySQL\bin\mysql.exe --user=dayz --password=dayz --host=127.0.0.1 --port=3306 --database=epoch --execute=""
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Starting server...
start .\arma2oaserver.exe -mod=Expansion\beta;Expansion\beta\expansion;ca;@dayz_overwatch;@dayz_epoch;@iarezombie_server -name=infected -config=config\iarezombie.cfg -cfg=config\basic.cfg -profiles=config\iarezombie
.\MySQL\cecho {0A}	OK.{07} 
echo.
echo.
echo.
ping 127.0.0.1 -n 5 >NUL
exit