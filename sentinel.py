#!/usr/bin/env python3
"""
Roblox Sentinel - Real-time Roblox Chat Monitor & Discord Logger

A lightweight Python tool that monitors your local Roblox logs in real-time
and forwards chat messages to a Discord channel via Webhooks.
"""

import os
import sys
import time
import glob
import logging
from pathlib import Path

try:
    import requests
except ImportError:
    print("[!] ERROR: 'requests' library not found!")
    print("[*] Please install it with: pip install requests")
    sys.exit(1)

# --- CONFIGURATION ---
# SECURITY: Never hardcode webhooks! Use environment variables instead:
# On Windows: set DISCORD_WEBHOOK=your_webhook_url
# On Mac/Linux: export DISCORD_WEBHOOK="your_webhook_url"
DISCORD_WEBHOOK_URL = os.environ.get('DISCORD_WEBHOOK', "YOUR_WEBHOOK_HERE")
LOG_PATH_PATTERN = os.path.join(
    os.environ.get('LOCALAPPDATA', os.path.expanduser('~')),
    "Roblox",
    "logs",
    "*.log"
)
CHECK_INTERVAL = 0.5  # Seconds between log file checks
DISCORD_RETRY_ATTEMPTS = 3
DISCORD_TIMEOUT = 5  # Seconds

# --- LOGGING SETUP ---
logging.basicConfig(
    level=logging.INFO,
    format='[%(asctime)s] %(levelname)s - %(message)s',
    datefmt='%H:%M:%S'
)
logger = logging.getLogger(__name__)


def send_to_discord(message):
    """
    Send a message to Discord via Webhook.
    
    Args:
        message (str): The message to send
        
    Returns:
        bool: True if successful, False otherwise
    """
    if DISCORD_WEBHOOK_URL == "YOUR_WEBHOOK_HERE":
        return False
    
    payload = {"content": f"🛡️ **Chat:** {message}"}
    
    for attempt in range(DISCORD_RETRY_ATTEMPTS):
        try:
            response = requests.post(
                DISCORD_WEBHOOK_URL,
                json=payload,
                timeout=DISCORD_TIMEOUT
            )
            response.raise_for_status()
            return True
        except requests.exceptions.Timeout:
            logger.warning(f"[Discord] Timeout on attempt {attempt + 1}/{DISCORD_RETRY_ATTEMPTS}")
        except requests.exceptions.ConnectionError:
            logger.warning(f"[Discord] Connection error on attempt {attempt + 1}/{DISCORD_RETRY_ATTEMPTS}")
        except requests.exceptions.HTTPError as e:
            logger.error(f"[Discord] HTTP Error: {e.response.status_code}")
            return False
        except Exception as e:
            logger.error(f"[Discord] Unexpected error: {str(e)}")
            return False
        
        if attempt < DISCORD_RETRY_ATTEMPTS - 1:
            time.sleep(1)  # Wait before retry
    
    logger.error("[Discord] Failed to send message after all retries")
    return False


def get_latest_log_file():
    """
    Find the most recently modified Roblox log file.
    
    Returns:
        str: Path to the latest log file, or None if not found
    """
    try:
        log_files = glob.glob(LOG_PATH_PATTERN)
        if not log_files:
            return None
        return max(log_files, key=os.path.getmtime)
    except Exception as e:
        logger.error(f"Error finding log file: {str(e)}")
        return None


def monitor_chat():
    """
    Monitor Roblox chat logs in real-time and send to Discord.
    """
    logger.info("🛡️  Roblox Sentinel started")
    logger.info(f"Looking for logs at: {LOG_PATH_PATTERN}")
    
    if DISCORD_WEBHOOK_URL == "YOUR_WEBHOOK_HERE":
        logger.warning("⚠️  Discord Webhook not configured. Chat will only be displayed locally.")
    else:
        logger.info("✅ Discord Webhook configured")
    
    current_log = get_latest_log_file()
    if not current_log:
        logger.error("[!] No Roblox logs found!")
        logger.info("📝 Make sure:")
        logger.info("   1. Roblox is running")
        logger.info("   2. You're running this on Windows")
        logger.info("   3. Roblox log files exist at: %localappdata%\\Roblox\\logs\\")
        return
    
    logger.info(f"📋 Monitoring: {os.path.basename(current_log)}")
    logger.info("Waiting for chat messages...\n")
    
    try:
        with open(current_log, "r", encoding="utf-8", errors="ignore") as file:
            # Start at end of file
            file.seek(0, os.SEEK_END)
            
            last_log_file = current_log
            
            while True:
                # Check if a new log file has been created (new Roblox session)
                new_log = get_latest_log_file()
                if new_log and new_log != last_log_file:
                    logger.info(f"🔄 New Roblox session detected. Switching to: {os.path.basename(new_log)}")
                    file.close()
                    file = open(new_log, "r", encoding="utf-8", errors="ignore")
                    file.seek(0, os.SEEK_END)
                    last_log_file = new_log
                
                line = file.readline()
                if not line:
                    time.sleep(CHECK_INTERVAL)
                    continue
                
                # Extract chat messages
                if "Chat Message" in line:
                    try:
                        parts = line.split("Chat Message:")
                        if len(parts) > 1:
                            message = parts[1].strip()
                            print(f"[CHAT] {message}")
                            send_to_discord(message)
                    except Exception as e:
                        logger.error(f"Error processing chat message: {str(e)}")
                        
    except KeyboardInterrupt:
        logger.info("\n👋 Roblox Sentinel stopped by user")
    except FileNotFoundError:
        logger.error("Log file was deleted or moved")
    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
    finally:
        try:
            file.close()
        except:
            pass


if __name__ == "__main__":
    try:
        monitor_chat()
    except KeyboardInterrupt:
        logger.info("Exiting...")
        sys.exit(0)