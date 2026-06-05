if exist opera-proxy.windows-amd64.exe (
echo -opera- > cver.txt
opera-proxy.windows-amd64.exe -version >> cver.txt
)
if exist hola-proxy.windows-amd64.exe (
echo -hola- >> cver.txt
hola-proxy.windows-amd64.exe -version >> cver.txt
)
if exist dumbproxy.windows-amd64.exe (
echo -dumb- >> cver.txt
dumbproxy.windows-amd64.exe -version >> cver.txt
)
if exist usque.exe (
echo -usque- >> cver.txt
usque.exe version >> cver.txt
)
if exist "%~1" (
echo -tor- >> cver.txt
"%~1" --version >> cver.txt
)