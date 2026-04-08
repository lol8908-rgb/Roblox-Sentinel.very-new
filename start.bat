@echo off
setlocal enabledelayedexpansion

REM Roblox Sentinel - Quick Start Batch File
REM Double-click this file to start monitoring!

title Roblox Sentinel
color 0A

echo.
echo ╔═══════════════════════════════════════════════╗
echo ║      🛡️  Roblox Sentinel - Chat Monitor      ║
echo ╚═══════════════════════════════════════════════╝
echo.

REM Check if Python is installed
where python >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERROR: Python is not installed or not in PATH!
    echo.
    echo 📥 Please:
    echo    1. Install Python from: https://www.python.org/
    echo    2. Make sure to check "Add Python to PATH"
    echo    3. Restart this batch file
    echo.
    echo Press any key to close...
    pause >nul
    exit /b 1
)

echo ✅ Python detected!
python --version
echo.

REM Check if requirements are installed
echo ⏳ Checking dependencies...
pip list | findstr "requests" >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Installing required packages...
    echo.
    pip install -r requirements.txt
    echo.
)

echo.
echo ✅ Everything is ready!
echo.
echo 🚀 Starting Roblox Sentinel...
echo.
echo ════════════════════════════════════════════════
echo.
echo Monitoring your Roblox logs...
echo Press CTRL+C to stop
echo.

REM Start the sentinel
python sentinel.py

REM Show pause at end
echo.
echo ════════════════════════════════════════════════
echo Sentinel stopped.
echo.
echo Press any key to close this window...
pause >nul

