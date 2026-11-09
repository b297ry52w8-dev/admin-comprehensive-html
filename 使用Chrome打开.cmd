@echo off
setlocal
set "PAGE=%~dp0index.html"

if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
  start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe" "%PAGE%"
  exit /b 0
)

if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
  start "" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" "%PAGE%"
  exit /b 0
)

if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" (
  start "" "%LocalAppData%\Google\Chrome\Application\chrome.exe" "%PAGE%"
  exit /b 0
)

where chrome.exe >nul 2>nul
if %errorlevel% equ 0 (
  start "" chrome.exe "%PAGE%"
  exit /b 0
)

echo Google Chrome was not found on this computer.
echo Please install Chrome or open index.html manually in another browser.
pause
