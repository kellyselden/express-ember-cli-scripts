pushd %~dp0..
copy scripts\host-express server\host
copy scripts\github-ember server\github
copy scripts\facebook-ember server\facebook
copy scripts\mongo-heroku server\connectionstring
pushd server
call nodemon index
popd
popd