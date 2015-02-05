pushd %~dp0
call clean-tmp
call install
pushd ..
pushd client
<nul set /p=%2>host
call ember build --environment=%1
del /q host
popd
if exist server\public (rd server\public /s /q)
echo d | xcopy client\dist server\public /S
popd
popd