import os
import time
import glob
import requests  # We need this for Discord

# --- CONFIGURATION ---
# Replace with your actual Discord Webhook URL
DISCORD_WEBHOOK_URL = "YOUR_WEBHOOK_HERE" 
LOG_PATH = os.path.join(os.environ['LOCALAPPDATA'], "Roblox", "logs", "*.log")

def send_to_discord(message):
    if DISCORD_WEBHOOK_URL == "YOUR_WEBHOOK_HERE":
        return
    data = {"content": f"🛡️ **New Chat:** {message}"}
    requests.post(DISCORD_WEBHOOK_URL, json=data)

def get_latest_log_file():
    list_of_files = glob.glob(LOG_PATH)
    if not list_of_files:
        return None
    return max(list_of_files, key=os.path.getmtime)

def monitor_chat():
    current_log = get_latest_log_file()
    if not current_log:
        print("[!] No logs found. Make sure you run this on your Windows PC!")
        return

    print(f"[*] Monitoring: {os.path.basename(current_log)}")

    with open(current_log, "r", encoding="utf-8", errors="ignore") as file:
        file.seek(0, os.SEEK_END)
        while True:
            line = file.readline()
            if not line:
                time.sleep(0.5)
                continue
            
            if "Chat Message" in line:
                parts = line.split("Chat Message:")
                if len(parts) > 1:
                    message = parts[1].strip()
                    print(f"[CHAT] {message}")
                    send_to_discord(message)

if __name__ == "__main__":
    monitor_chat()
