pushd %~dp0
for /f %%i in (heroku) do set heroku=%%i
call build heroku
pushd ..
md heroku
ROBOCOPY /MIR server heroku /XD node_modules heroku /XF .git /XF .gitignore
pushd heroku
git init
git add . && git commit -a -m "deploy"
call heroku git:remote -a %heroku%
git push heroku master -f
popd
popd
popd