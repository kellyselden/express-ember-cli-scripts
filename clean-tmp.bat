pushd %~dp0..\client
for /d %%p in ("tmp\*") do rd "%%p" /s /q
popd