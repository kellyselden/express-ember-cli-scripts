pushd %~dp0
set count=0
:restart-build
call clean-tmp
call install
call version
pushd ..
pushd client
call ember build --environment=%1 >stdout.txt
type stdout.txt
findstr /C:"Cleanup error" stdout.txt
if %errorlevel%==0 goto :error
goto :success
:error
set /a count+=1
if %count% lss 10 (
  popd
  goto :restart-build
) else (
  exit /b 1
)
:success
del stdout.txt
popd
if exist server\public (rd server\public /s /q)
echo d | xcopy client\dist server\public /S
popd
popd