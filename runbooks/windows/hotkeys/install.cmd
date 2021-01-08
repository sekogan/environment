@echo off

set COMMAND=%~dp0start.cmd

call %COMMAND%
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v HotKeys /d "%COMMAND%" /f
if errorlevel 1 goto Abort
echo Done!
exit /b 0

:Abort
echo Installation aborted.
exit /b 1
