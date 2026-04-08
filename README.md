# 🛡️ Roblox Sentinel

> A lightweight, Python-based real-time chat monitor for Roblox with Discord Webhook integration.

Roblox Sentinel monitors your local Roblox logs in real-time and automatically forwards chat messages to a Discord channel. It's **100% ban-safe** as it only reads local log files and never injects code or touches game memory.

---

## ✨ Features

- ✅ **Real-time Monitoring** — See chat messages instantly in your console
- ✅ **Discord Integration** — Automatically send chat logs to Discord via Webhooks
- ✅ **100% Ban-Safe** — Only reads local log files, no injection or memory tampering
- ✅ **Automatic Detection** — Finds the latest Roblox session logs automatically
- ✅ **Robust Error Handling** — Gracefully handles connection issues and missing data
- ✅ **Lightweight** — Minimal CPU and RAM usage
- ✅ **Cross-Session Support** — Automatically switches between multiple Roblox sessions

---

## 🚀 Quick Start

### Prerequisites
- **Windows PC** (Mac/Linux support can be added)
- **Python 3.7+** — [Download here](https://www.python.org/)
- **Roblox** — The game should be running

### Installation

1. **Clone or download this repository**
   ```bash
   git clone https://github.com/yourusername/Roblox-Sentinel.git
   cd Roblox-Sentinel
   ```

2. **Install Python dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Configure Discord Webhook (Optional)**
   - Open `sentinel.py` in a text editor
   - Find this line:
     ```python
     DISCORD_WEBHOOK_URL = "YOUR_WEBHOOK_HERE"
     ```
   - Replace `"YOUR_WEBHOOK_HERE"` with your Discord Webhook URL
   - [How to create a Discord Webhook](https://support.discord.com/hc/en-us/articles/228383668)

4. **Run the script**
   ```bash
   python sentinel.py
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

This project is open source. Feel free to fork, modify, and share.

---

## 💬 Support

If you have issues:
1. Check the **Troubleshooting** section above
2. Review your console output for error messages
3. Make sure all prerequisites are installed
4. Verify your Discord Webhook is configured correctly

---

**Made with ❤️ for the Roblox community**