pushd %~dp0\..
git rev-parse --abbrev-ref HEAD>version
git rev-parse --verify --short HEAD>>version
git log -1 --date=rfc --pretty=format:%%cd>>version
copy version server\version
move version client\version
popd