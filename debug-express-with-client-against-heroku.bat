pushd %~dp0..
copy scripts\host-express server\host
copy scripts\github-express server\github
copy scripts\facebook-express server\facebook
copy scripts\mongo-heroku server\connectionstring
pushd server
call nodemon index
popd
popd