@echo off
setlocal
set "SCRIPT=%~dp0本地预览服务器.ps1"
set "URL=http://127.0.0.1:4173/index.html#/portal/home"
start "行政综合原型本地服务" powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%SCRIPT%"
timeout /t 1 /nobreak >nul
start "" "%URL%"
exit /b 0
