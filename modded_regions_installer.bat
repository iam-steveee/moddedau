@echo off
setlocal enabledelayedexpansion

echo ===============================================
echo    Modded Regions Installer for Among Us
echo ===============================================
echo.

:: Define the URL of the regionInfo.json file
set "url=https://ehr.gurge44.eu/regionInfo.json"
set "destination=%USERPROFILE%\AppData\LocalLow\Innersloth\Among Us\regionInfo.json"

:: Check if destination directory exists
if not exist "%USERPROFILE%\AppData\LocalLow\Innersloth\Among Us" (
    echo ERROR: Among Us folder not found!
    echo Please make sure Among Us is installed.
    echo.
    pause
    exit /b 1
)

:: Download the file using PowerShell
echo Downloading regionInfo.json...
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%destination%'"

:: Check if download was successful
if exist "%destination%" (
    echo.
    echo ===============================================
    echo SUCCESS! Modded regions installed successfully!
    echo ===============================================
    echo.
    echo If Among Us is currently running, please restart
    echo it for the changes to take effect.
    echo.
) else (
    echo.
    echo ===============================================
    echo ERROR: Failed to download regionInfo.json
    echo ===============================================
    echo.
    echo Please try downloading manually from:
    echo https://ehr.gurge44.eu/regionInfo.json
    echo.
)

pause
