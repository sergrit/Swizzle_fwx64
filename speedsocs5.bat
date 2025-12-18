@echo off
setlocal EnableDelayedExpansion
if "%~1"=="" (
    echo Usage: %~nx0 proxy_address:port
    echo Example: %~nx0 127.0.0.1:1080
    exit /b
)
set proxy=%~1
set speedTestUtility=curl.exe
set speedTestSite=https://speedtest.selectel.ru/10MB
set tmpLog=tmpSpeed.log
if exist "%tmpLog%" del /q "%tmpLog%"
%speedTestUtility% --socks5 %proxy% -o NUL -s -w "speed_download=%%{speed_download}\n" %speedTestSite% > "%tmpLog%" 2>&1
for /f "tokens=2 delims==" %%a in ('findstr /c:"speed_download" "%tmpLog%"') do set rawSpeed=%%a
set /a kiloBits=!rawSpeed! * 8 / 1024
set /a megaBits=!kiloBits! / 1024
echo !megaBits!.!kiloBits! Mb/s
if exist "%tmpLog%" del /q "%tmpLog%"
exit