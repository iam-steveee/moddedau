@echo off
setlocal EnableExtensions

title MAUL Custom Server Installer

rem Inspired by NikoCat233's custom server installer.
rem Thank you, NikoCat233, for the inspiration and years of help supporting the modded Among Us community.

if not defined MAUL_REGIONINFO_URL set "MAUL_REGIONINFO_URL=https://raw.githubusercontent.com/Sarhadactyl/MAULweb/main/data/regioninfo.json"
if not defined MAUL_INSTALL_TARGET set "MAUL_INSTALL_TARGET=%USERPROFILE%\AppData\LocalLow\Innersloth\Among Us"

set "DEST=%MAUL_INSTALL_TARGET%\regionInfo.json"
set "TEMP_FILE=%TEMP%\maul-regioninfo-%RANDOM%%RANDOM%.json"

echo.
echo MAUL Custom Server Installer
echo ----------------------------
echo This installs the MAUL custom region list for Among Us.
echo.
echo Region source:
echo   %MAUL_REGIONINFO_URL%
echo.
echo Destination:
echo   %DEST%
echo.

echo Downloading the latest MAUL regioninfo.json...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -UseBasicParsing -Uri ($env:MAUL_REGIONINFO_URL + '?t=' + [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()) -OutFile $env:TEMP_FILE"
if errorlevel 1 (
  echo PowerShell download failed. Trying curl...
  curl.exe -L --fail --output "%TEMP_FILE%" "%MAUL_REGIONINFO_URL%?t=%RANDOM%%RANDOM%"
  if errorlevel 1 goto download_failed
)

echo Checking the region file...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $json = Get-Content -LiteralPath $env:TEMP_FILE -Raw | ConvertFrom-Json; if (-not $json.Regions) { throw 'regionInfo.json is missing the Regions list.' }; $regions = @($json.Regions); $maulRegions = @($regions | Where-Object { ($_.Name -match '^MAUL') -or ($_.PingServer -match 'moddedamong\.us') -or (@($_.Servers) | Where-Object { $_.Ip -match 'moddedamong\.us' }) }); if ($maulRegions.Count -eq 0) { throw 'No MAUL regions were found in this regionInfo.json.' }; Write-Host ('Found {0} MAUL region entries.' -f $maulRegions.Count)"
if errorlevel 1 goto invalid_json

if not exist "%MAUL_INSTALL_TARGET%" (
  echo Creating Among Us settings folder...
  mkdir "%MAUL_INSTALL_TARGET%" >nul 2>nul
  if errorlevel 1 goto install_failed
)

for /f %%I in ('powershell.exe -NoProfile -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set "STAMP=%%I"

if exist "%DEST%" (
  echo Backing up your current regionInfo.json...
  copy /Y "%DEST%" "%MAUL_INSTALL_TARGET%\regionInfo.backup-%STAMP%.json" >nul
  if errorlevel 1 goto install_failed
)

echo Installing MAUL regionInfo.json...
copy /Y "%TEMP_FILE%" "%DEST%" >nul
if errorlevel 1 goto install_failed

del "%TEMP_FILE%" >nul 2>nul

echo.
echo Done. Restart Among Us, then choose a MAUL region in the region selector.
echo.
pause
exit /b 0

:download_failed
echo.
echo Could not get the MAUL region file.
echo Check your internet connection and try again.
echo.
pause
exit /b 1

:invalid_json
echo.
echo The downloaded region file did not look valid, so nothing was installed.
echo.
del "%TEMP_FILE%" >nul 2>nul
pause
exit /b 1

:install_failed
echo.
echo The installer could not write the region file.
echo Try closing Among Us and running this installer again.
echo.
del "%TEMP_FILE%" >nul 2>nul
pause
exit /b 1
