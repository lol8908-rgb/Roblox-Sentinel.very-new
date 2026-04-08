# 🛡️ Roblox Sentinel

> A lightweight, Python-based real-time chat monitor for Roblox with Discord Webhook integration.

[![GitHub Stars](https://img.shields.io/github/stars/lol8908-rgb/Roblox-Sentinel.very-new?style=flat-square)](https://github.com/lol8908-rgb/Roblox-Sentinel.very-new)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)
[![Python 3.7+](https://img.shields.io/badge/Python-3.7+-blue?style=flat-square)](https://www.python.org/)
[![Status: Active](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)]()

---

## 📥 Quick Download

| Platform | Download |
|----------|----------|
| 💻 **Windows** | [Clone or Download ZIP](https://github.com/lol8908-rgb/Roblox-Sentinel.very-new/archive/refs/heads/main.zip) |
| 🐧 **Linux/Mac** | [Clone Repo](https://github.com/lol8908-rgb/Roblox-Sentinel.very-new.git) |
| 👨‍💻 **Developers** | `git clone https://github.com/lol8908-rgb/Roblox-Sentinel.very-new.git` |

**Latest Version:** `v1.5.0` ([View Changelog](CHANGELOG.md))

---

Roblox Sentinel monitors your local Roblox logs in real-time and automatically forwards chat messages to a Discord channel. It's **100% ban-safe** as it only reads local log files and never injects code or touches game memory.

---

## ✨ Features

### 🎮 Core Features
- ✅ **Real-time Monitoring** — See chat messages instantly in your console with zero lag
- ✅ **Discord Integration** — Automatically send chat logs to Discord via Webhooks
- ✅ **100% Ban-Safe** — Only reads local log files, no injection or memory tampering
- ✅ **Automatic Detection** — Finds the latest Roblox session logs automatically
- ✅ **Cross-Session Support** — Automatically switches between multiple Roblox sessions

### 🛠️ Technical Features
- ✅ **Robust Error Handling** — Gracefully handles connection issues and missing data
- ✅ **Retry Logic** — 3 automatic attempts for Discord webhook failures
- ✅ **Network Timeouts** — 5-second timeout to prevent hanging
- ✅ **Environment Variables** — Secure credential management (no hardcoded secrets)
- ✅ **Lightweight** — Minimal CPU and RAM usage, ~5MB memory footprint
- ✅ **Cross-Platform** — Windows, Mac, and Linux compatible

### 🔒 Security Features
- ✅ **No Code Injection** — Pure read-only log monitoring
- ✅ **No Memory Access** — Doesn't touch Roblox process memory
- ✅ **Secure Config** — Uses environment variables instead of hardcoded credentials
- ✅ **Git-Safe** — Includes `.gitignore` to prevent credential leaks

---

## 🚀 Quick Start

### Prerequisites
- **Windows PC** (Mac/Linux support can be added)
- **Python 3.7+** — [Download here](https://www.python.org/)
- **Roblox** — The game should be running

### ⚡ Super Easy Installation (Windows)

**Method 1: One-Click Start** ⭐ (Easiest!)
1. Download the repository as ZIP
2. Extract it
3. **Double-click `setup.bat`** ← Installs everything automatically!
4. **Double-click `start.bat`** ← Launches the app!

**Method 2: Manual Installation**
1. **Clone or download this repository**
   ```bash
   git clone https://github.com/yourusername/Roblox-Sentinel.git
   cd Roblox-Sentinel
   ```

2. **Install Python dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Configure Discord Webhook (Optional & Secure)**
   
   ⚠️ **SECURITY WARNING**: Never hardcode your Webhook URL in the code!
   
   Instead, use environment variables:
   
   **On Windows (CMD):**
   ```bash
   set DISCORD_WEBHOOK=https://discord.com/api/webhooks/YOUR_ID/YOUR_TOKEN
   ```
   
   **On Windows (PowerShell):**
   ```powershell
   $env:DISCORD_WEBHOOK="https://discord.com/api/webhooks/YOUR_ID/YOUR_TOKEN"
   ```
   
   **On Mac/Linux:**
   ```bash
   export DISCORD_WEBHOOK="https://discord.com/api/webhooks/YOUR_ID/YOUR_TOKEN"
   ```
   
   [How to create a Discord Webhook](https://support.discord.com/hc/en-us/articles/228383668)

4. **Run the script**
   ```bash
   python sentinel.py
   ```
   
   **OR** just double-click `start.bat`!

---

## 🎁 Optional: Build Standalone .exe

Want a single `.exe` file without needing Python installed?

See [BUILD_EXE.md](BUILD_EXE.md) for detailed instructions.

Quick command:
```bash
pip install pyinstaller
pyinstaller --onefile sentinel.py
```

---

## 📖 How It Works

1. **Log Detection** — Sentinel locates your Roblox log files at `%localappdata%/Roblox/logs/`
2. **Real-time Tracking** — It continuously reads new log entries as they're written
3. **Chat Extraction** — When a "Chat Message" is detected, it's parsed and extracted
4. **Discord Delivery** — The message is sent to Discord (if configured)
5. **Session Switching** — Automatically adapts when you start a new Roblox session

### Log File Structure

Roblox stores chat messages in log files with this format:
```
[timestamp] Chat Message: Username: Hello everyone!
```

Sentinel extracts and formats this as:
```
[CHAT] Username: Hello everyone!
🛡️ **Chat:** Username: Hello everyone!
```

---

## ⚙️ Configuration

Edit `sentinel.py` to customize:

```python
# Discord Webhook URL (leave as "YOUR_WEBHOOK_HERE" to disable)
DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/YOUR_ID/YOUR_TOKEN"

# Log file location (auto-detects on Windows)
LOG_PATH_PATTERN = os.path.join(...)

# Check interval in seconds
CHECK_INTERVAL = 0.5
```

---

## 🔧 Troubleshooting

### "No Roblox logs found!"
- **Solution 1** — Make sure Roblox is running
- **Solution 2** — Check that log files exist at: `C:\Users\YourUsername\AppData\Local\Roblox\logs\`
- **Solution 3** — You're not on Windows (Mac/Linux users need to provide their log path)

### "Discord webhook not configured"
- This is a **warning**, not an error — chat will still display locally
- To enable Discord, add your Webhook URL to `sentinel.py`

### Discord messages not sending
- **Check 1** — Verify your Webhook URL is correct
- **Check 2** — Ensure your internet connection is stable
- **Check 3** — The Discord server might be temporarily unavailable
- **Check 4** — Look for error messages in the console

### Script crashes unexpectedly
- Run it again — it has automatic recovery
- Check console output for error messages
- Make sure `requests` is installed: `pip install requests`

---

## 📦 Requirements

See `requirements.txt` for dependencies:

```
requests>=2.28.0
```

Only `requests` is needed to send data to Discord. Everything else uses Python's standard library.

---

## 🎮 Usage Examples

### Example 1: Monitor locally only
```bash
python sentinel.py
```
Chat messages appear in your console only.

### Example 2: Monitor with Discord
1. Set up a Discord Webhook
2. Add it to `sentinel.py`
3. Run: `python sentinel.py`
4. Chat appears in both console and Discord

### Example 3: Run in background (Windows)
```bash
start /min python sentinel.py
```

---

## ⚠️ Disclaimer

This tool is **100% ban-safe** because:
- ✅ It only **reads** local log files
- ✅ It does **NOT** inject code into Roblox
- ✅ It does **NOT** modify game memory
- ✅ It does **NOT** send data to Roblox servers
- ✅ It only accesses your local `%localappdata%/Roblox/logs/` directory

**However**, your usage of this tool is your own responsibility. Use it responsibly and in accordance with Roblox's Terms of Service.

---

## 📝 License

This project is licensed under the **MIT License** — See [LICENSE](LICENSE) file for details.

You are free to:
- ✅ Use this software for any purpose
- ✅ Copy, modify, and distribute it
- ✅ Use it commercially or privately

Just keep the license and copyright notice included.

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Commit** your changes: `git commit -m 'Add amazing feature'`
4. **Push** to the branch: `git push origin feature/amazing-feature`
5. **Open** a Pull Request

### Areas to Contribute
- 🐛 Bug fixes and improvements
- 📝 Documentation enhancements
- 🎨 UI/UX improvements (especially for future GUI)
- 🧪 Unit tests
- 🔧 Feature development

---

## 💬 Support & Community

- 📖 **Documentation** — Check [README.md](README.md) and [CHANGELOG.md](CHANGELOG.md)
- 🐛 **Report Bugs** — [Open an Issue](https://github.com/lol8908-rgb/Roblox-Sentinel.very-new/issues)
- 💡 **Request Features** — [Create a Discussion](https://github.com/lol8908-rgb/Roblox-Sentinel.very-new/discussions)
- 🤔 **Ask Questions** — [GitHub Discussions](https://github.com/lol8908-rgb/Roblox-Sentinel.very-new/discussions)

---

## 🙏 Credits

- Built for the **Roblox community**
- Uses **Discord Webhooks API**
- Powered by **Python** and **requests**
- Inspired by log monitoring best practices

---

**Made with ❤️ for the Roblox community**

### Star this repo if you find it useful! ⭐