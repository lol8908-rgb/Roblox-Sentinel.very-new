@echo off
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
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERROR: Python is not installed!
    echo.
    echo 📥 Please install Python from: https://www.python.org/
    echo.
    pause
    exit /b 1
)

echo ✅ Python detected
echo.

REM Check if requirements are installed
echo ⏳ Checking dependencies...
pip list | findstr "requests" >nul 2>&1
if errorlevel 1 (
    echo 📦 Installing required packages...
    pip install -r requirements.txt
)

echo.
echo ✅ Everything is ready!
echo.
echo 🚀 Starting Roblox Sentinel...
echo.
echo ════════════════════════════════════════════════
echo.

REM Start the sentinel
python sentinel.py

pause
