@echo off
@title Server #1
:iniServer
echo.
echo MAGNUS ER SEJ
echo.
echo.
echo Initiating Server [Port:30120]
echo %date%
echo.
echo %time% : Searching for Cache...
rmdir /S /Q cache
timeout /t 2 >nul
echo %time% : Cache Cleared!
echo %time% : Starter serveren
FXServer +set citizen_dir %~dp0\citizen\ +exec server.cfg +set onesync legacy
echo %time% : Server was shut down..
timeout /t 2 >nul
echo %time% : Prøver at genstarte serveren...
timeout /t 3 >nul
echo.
goto iniServer