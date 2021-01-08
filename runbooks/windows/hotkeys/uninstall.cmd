@echo off

taskkill /F /IM autohotkey.exe >NUL 2>&1
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v HotKeys /f >NUL 2>&1

echo Uninstalled.
