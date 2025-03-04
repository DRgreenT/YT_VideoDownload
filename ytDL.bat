@echo off
setlocal enabledelayedexpansion

:: Load settings from config.ini
for /f "tokens=1,2 delims==" %%A in (%~dp0config.ini) do (
    set "%%A=%%B"
)

:: If no URL is set in config.ini, prompt the user
if "!yt-url!"=="" (
    set /p yt-url=Enter YouTube URL: 
)

:: Ensure output folder exists
mkdir "!output-folder!" 2>nul

:: Initialize download attempt counter
set attempt=1
set /a start_time=%time:~0,2% * 3600 + %time:~3,2% * 60 + %time:~6,2%

:download_loop
cls
:: Calculate elapsed time
set /a current_time=%time:~0,2% * 3600 + %time:~3,2% * 60 + %time:~6,2%
set /a elapsed_time=current_time - start_time

:: Convert elapsed seconds to hh:mm:ss
set /a hh=elapsed_time / 3600
set /a mm=(elapsed_time %% 3600) / 60
set /a ss=elapsed_time %% 60

:: Format time correctly (ensuring two-digit format)
if %hh% LSS 10 set hh=0%hh%
if %mm% LSS 10 set mm=0%mm%
if %ss% LSS 10 set ss=0%ss%

echo =========================================
echo Attempt !attempt! - Elapsed Time: %hh%:%mm%:%ss%
echo Using settings:
echo - Limit rate: !limit-rate!
echo - Throttle rate: !throttled-rate!
echo - Retries: !fragment-retries!
echo - Format: !format!
echo =========================================

:: Change directory to "source" before running yt-dlp.exe
cd /d "%~dp0source"

:: Run yt-dlp using settings from config.ini
yt-dlp.exe --fragment-retries !fragment-retries! --throttled-rate !throttled-rate! --limit-rate !limit-rate! --force-ipv4 -f "!format!" -o "!output-folder!\%(title).50s.%(ext)s" --restrict-filenames "!yt-url!"

:: Check if an MP4 or AVI file exists
if exist "!output-folder!\*.mp4" (
    echo Download successful - MP4 file found.
    goto :end
)
if exist "!output-folder!\*.avi" (
    echo Download successful - AVI file found.
    goto :end
)

:: If no file is found, wait before retrying
echo No video file found. Retrying in !retry-wait! seconds...
timeout /t !retry-wait! /nobreak

:: Increase counter by 1 and retry
set /a attempt+=1
goto :download_loop

:end
cls
:: Calculate final elapsed time
set /a current_time=%time:~0,2% * 3600 + %time:~3,2% * 60 + %time:~6,2%
set /a elapsed_time=current_time - start_time
set /a hh=elapsed_time / 3600
set /a mm=(elapsed_time %% 3600) / 60
set /a ss=elapsed_time %% 60
if %hh% LSS 10 set hh=0%hh%
if %mm% LSS 10 set mm=0%mm%
if %ss% LSS 10 set ss=0%ss%

echo =========================================
echo Download completed! Video saved in:
echo !output-folder!
echo Total Time: %hh%:%mm%:%ss%
echo =========================================
pause
