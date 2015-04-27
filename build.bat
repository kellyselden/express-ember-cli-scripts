pushd %~dp0..

copy scripts\host-%1 client\host
copy scripts\github-%1 client\github
copy scripts\facebook-%1 client\facebook

copy scripts\host-%1 server\host
copy scripts\github-%1 server\github
copy scripts\facebook-%1 server\facebook
copy scripts\mongo-%1 server\connectionstring

pushd scripts
set count=0
:restart-build
call clean-tmp
call install
call version
pushd ..\client
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
popd

if exist server\public (rd server\public /s /q)
echo d | xcopy client\dist server\public /S

popd