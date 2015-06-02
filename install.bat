pushd %~dp0..\client
SETLOCAL
set count=0
:restart
call npm prune
call npm install
call bower prune
call bower install --config.interactive=false 2>stderr.txt
type stderr.txt
findstr "ECONFLICT" stderr.txt
if %errorlevel%==0 goto :error
findstr "ECMDERR" stderr.txt
if %errorlevel%==0 goto :error
findstr "ECONNREFUSED" stderr.txt
if %errorlevel%==0 goto :error
findstr "EPERM" stderr.txt
if %errorlevel%==0 goto :error
goto :success
:error
if %count% geq 10 exit /b 1
set /a count+=1
rd bower_components /s /q
goto :restart
:success
del stderr.txt
ENDLOCAL
popd