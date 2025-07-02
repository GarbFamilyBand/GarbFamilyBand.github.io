@echo off
setlocal enabledelayedexpansion

:: Get current date and time
for /f "tokens=1-7 delims=/:. " %%a in ("%date% %time%") do (
    set mm=%%a
    set dd=%%b
    set yy=%%c
    set hh=%%d
    set mi=%%e
    set ss=%%f
)

:: Adjust for different date formats (e.g. MM/DD/YYYY or DD/MM/YYYY)
:: Extract 2-digit year (last 2 chars of yyyy)
set yy=%yy:~-2%

:: Pad hours if needed
if 1%hh% LSS 20 set hh=0%hh%
if 1%mi% LSS 20 set mi=0%mi%
if 1%ss% LSS 20 set ss=0%ss%

:: Final timestamp string
set timestamp=%yy%%mm%%dd%%hh%%mi%%ss%

echo %timestamp%
endlocal


git add --all
git commit -m "commit " %timestamp%
git push -u origin main