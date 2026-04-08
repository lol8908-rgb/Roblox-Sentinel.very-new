@echo off
REM Roblox Sentinel - Setup Script
REM Run this once to set everything up!

title Roblox Sentinel - Setup
color 0A

echo.
echo ╔═══════════════════════════════════════════════╗
echo ║   🛡️  Roblox Sentinel - Setup Wizard         ║
echo ╚═══════════════════════════════════════════════╝
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERROR: Python is not installed!
    echo.
    echo 📥 Please install Python from: https://www.python.org/
    echo    Make sure to check "Add Python to PATH" during installation!
    echo.
    pause
    exit /b 1
)

echo ✅ Python is installed!
python --version
echo.

REM Install requirements
echo 📦 Installing dependencies...
echo.
pip install -r requirements.txt

if %errorlevel% equ 0 (
    echo.
    echo ✅ Setup completed successfully!
    echo.
    echo 📝 NEXT STEPS:
    echo.
    echo 1. Open start.bat to launch Roblox Sentinel
    echo.
    echo 2. (Optional) Configure Discord Webhook:
    echo    - Set environment variable DISCORD_WEBHOOK
    echo    On CMD:  set DISCORD_WEBHOOK=your_webhook_url
    echo    On PowerShell: $env:DISCORD_WEBHOOK="your_webhook_url"
    echo.
    echo 3. Open Roblox and start playing
    echo.
    echo 4. Double-click start.bat or run: python sentinel.py
    echo.
    echo 🎮 That's it! Your chat will now be monitored!
    echo.
) else (
    echo.
    echo ❌ Setup failed! Please check your internet connection.
    echo.
)

pause
