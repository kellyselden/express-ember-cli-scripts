pushd %~dp0
for /f %%i in (host-heroku) do set host_heroku=%%i
pushd ..
copy scripts\host-ember client\host
copy scripts\github-ember client\github
copy scripts\facebook-ember client\facebook
pushd client
call ember s --proxy=%host_heroku%
popd
popd
popd