@echo off
setlocal enabledelayedexpansion

REM Roblox Sentinel - Setup Script
REM Run this once to set everything up!

title Roblox Sentinel - Setup
color 0A

echo.
echo ╔═══════════════════════════════════════════════╗
echo ║   🛡️  Roblox Sentinel - Setup Wizard         ║
echo ╚═══════════════════════════════════════════════╝
echo.
echo Starting setup...
echo.

REM Check if Python is installed
where python >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERROR: Python is not installed or not in PATH!
    echo.
    echo 📥 Please:
    echo    1. Download Python from: https://www.python.org/
    echo    2. Run the installer
    echo    3. ⚠️  IMPORTANT: Check "Add Python to PATH"
    echo    4. After installing Python, run this setup again
    echo.
    echo For more help, visit: https://www.python.org/downloads/
    echo.
    echo Press any key to close...
    pause >nul
    exit /b 1
)

echo ✅ Python is installed!
python --version
echo.

REM Install requirements
echo 📦 Installing dependencies (requests library)...
echo.
pip install -r requirements.txt

if %errorlevel% equ 0 (
    echo.
    echo ════════════════════════════════════════════════
    echo.
    echo ✅ Setup completed successfully!
    echo.
    echo 📝 NEXT STEPS:
    echo.
    echo 1. Double-click "start.bat" to launch Roblox Sentinel
    echo.
    echo 2. (Optional) Configure Discord Webhook:
    echo    - Create a webhook: https://discord.com/developers/applications
    echo    - Set it as environment variable before running start.bat
    echo    - In CMD: set DISCORD_WEBHOOK=your_webhook_url
    echo    - In PowerShell: $env:DISCORD_WEBHOOK="your_webhook_url"
    echo.
    echo 3. Open Roblox and start playing
    echo.
    echo 4. Double-click start.bat to monitor chat
    echo.
    echo 🎮 That's it! Your chat will now be logged!
    echo.
    echo ════════════════════════════════════════════════
    echo.
) else (
    echo.
    echo ❌ Setup failed!
    echo.
    echo Possible reasons:
    echo - No internet connection
    echo - Firewall blocking pip install
    echo - Permission issues
    echo.
    echo Try running Command Prompt as Administrator
    echo and run this file again.
    echo.
)

echo Press any key to close this window...
pause >nul

