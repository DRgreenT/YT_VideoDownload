@echo off
setlocal enabledelayedexpansion

:: Change directory to "source"
cd /d "%~dp0source"

:: Load settings from config.ini
for /f "tokens=1,2 delims==" %%A in (%~dp0config.ini) do (
    set "%%A=%%B"
)

:: Prompt user to enter YouTube URL
set /p yt_url=Enter YouTube URL: 

:: Set download path (Desktop)
set output_folder=%USERPROFILE%\Desktop\YT_Download
mkdir "%output_folder%" 2>nul

:: Counter for download attempts
set attempt=1

:download_loop
cls
echo =========================================
echo Attempt %attempt%
echo Using settings: Limit rate=!limit-rate!, Throttle rate=!throttled-rate!, Retries=!fragment-retries!
echo =========================================

:: Change directory to "source" before running yt-dlp.exe
cd /d "%~dp0source"

:: Run yt-dlp using settings from config.ini
yt-dlp.exe --fragment-retries !fragment-retries! --throttled-rate !throttled-rate! --limit-rate !limit-rate! --force-ipv4 -f "!format!" -o "%output_folder%\%(title).50s.%(ext)s" --restrict-filenames "%yt_url%"

:: Check if an MP4 or AVI file exists
if exist "%output_folder%\*.mp4" (
    echo Download successful MP4 file found
    goto :end
)
if exist "%output_folder%\*.avi" (
    echo Download successful AVI file found
    goto :end
)

:: If no file is found, wait 1 minute and retry
echo No video file found Waiting 1 minute...
timeout /t 60 /nobreak

:: Increase counter by 1 and retry
set /a attempt+=1
goto :download_loop

:end
cls
echo =========================================
echo Download completed Video saved in
echo %output_folder%
echo =========================================
pause
