@echo off
setlocal enabledelayedexpansion

echo "Downloading Modded Regions from media.lotusau.top"
echo "This script downloads the following regions:"
echo " -------- "
echo "  - Modded(NA)"
echo "  - Modded(EU)"
echo "  - Modded(AS)"
echo "  - Niko233(NA)"
echo "  - Niko233(EU)"
echo "  - Niko233(AS)"
echo "  - MAUL(NA)"
echo "  - MAUL(EU)"
echo "  - Jarne's MEU"
echo " -------- "
echo "If you'd like to remove any of these regions at any time, you can go to the regionInfo.json file and remove the corresponding region object."
echo.

where curl >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo "Warning, you do not have CURL installed."
    echo "Please manually download regionInfo from https://media.lotusau.top/files/regionInfo.json"
    echo "And replace it with your new regionInfo.json (path depends on your platform)."
    pause
    exit /b
)

:menu
echo Which version of Among Us do you have?
echo   1. Steam, Epic Games, or Itch
echo   2. Microsoft Store
echo.
set /p platformChoice="Enter 1 or 2: "

if "%platformChoice%"=="1" goto steam
if "%platformChoice%"=="2" goto msstore

echo Invalid selection, please try again.
echo.
goto menu

:msstore
echo.
set "PKG_ROOT="
for /d %%P in ("%LOCALAPPDATA%\Packages\Innersloth.AmongUs_*") do set "PKG_ROOT=%%P"

if not defined PKG_ROOT (
    echo Could not find the Innersloth.AmongUs package folder.
    echo Please follow the manual installation steps on the page where you originally downloaded this script.
    pause
    exit /b
)

echo Scanning WGS save containers for regionInfo data, this may take a moment...

for /f "delims=" %%F in ('powershell -NoProfile -Command "Get-ChildItem -Path '!PKG_ROOT!\SystemAppData\wgs' -Recurse -File -ErrorAction SilentlyContinue | Select-String -Pattern 'StaticHttpRegionInfo, Assembly-CSharp' -SimpleMatch -List | Select-Object -ExpandProperty Path | Get-Item | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty FullName"') do set "TARGET_PATH=%%F"

if not defined TARGET_PATH (
    echo Could not automatically locate the regionInfo container.
    echo Please follow the manual installation steps on the page where you originally downloaded this script.
    pause
    exit /b
)

goto download

:steam
set "TARGET_PATH=%APPDATA%\..\LocalLow\Innersloth\Among Us\regionInfo.json"

:download
echo.
echo Target file: "!TARGET_PATH!"
echo.

curl -L --create-dirs --output "!TARGET_PATH!" --url "https://media.lotusau.top/files/regionInfo.json"

IF %ERRORLEVEL% NEQ 0 (
    echo "Download failed. Please check your internet connection and try again."
    echo "If this problem persists, follow the manual installation steps on the page where you originally downloaded this script."
    pause
    exit /b
)

echo "Installation complete :D, Open your Among Us and you should now have Modded Regions!"
pause