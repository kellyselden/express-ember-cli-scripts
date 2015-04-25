pushd %~dp0
for /f %%i in (heroku) do set heroku=%%i
pushd ..\client
call ember s --environment=heroku --proxy=http://%heroku%.herokuapp.com
popd
popd