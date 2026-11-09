@echo off
setlocal
for /f "tokens=2 delims==" %%P in ('wmic process where "name='powershell.exe' and commandline like '%%本地预览服务器.ps1%%'" get processid /value ^| find "="') do taskkill /PID %%P /F >nul 2>nul
exit /b 0
