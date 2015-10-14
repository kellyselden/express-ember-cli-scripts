pushd %~dp0
for /f %%i in (host-express) do set host_express=%%i
pushd ..
copy scripts\host-ember client\host
copy scripts\github-ember client\github
copy scripts\facebook-ember client\facebook
pushd client
call ember s --proxy=%host_express%
rem call ember s
popd
popd
popd