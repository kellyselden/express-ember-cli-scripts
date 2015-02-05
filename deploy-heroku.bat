pushd %~dp0
for /f %%i in (heroku) do set heroku=%%i
call build heroku http://%heroku%.herokuapp.com
pushd ..\server
md heroku
ROBOCOPY /MIR . heroku /XD node_modules heroku /XF .gitignore
pushd heroku
git init
git add . && git commit -a -m "deploy"
call heroku git:remote -a %heroku%
git push heroku master -f
popd
popd
popd