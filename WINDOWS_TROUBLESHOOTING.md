# Windows Troubleshooting Guide

Wenn `start.bat` oder `setup.bat` sich sofort schließen, hier sind die Lösungen:

---

## ❌ Problem: "Python not recognized"

### Lösung 1: Python richtig installieren
1. Download: https://www.python.org/downloads/
2. **WICHTIG**: Während Installation: Check ✅ "Add Python to PATH"
3. Nach der Installation: Neustart des Computers (wichtig!)
4. Versuche Setup wieder

### Lösung 2: Python manuell zur PATH hinzufügen
1. Öffne: `Settings` → `System` → `About`
2. Klick: `Advanced system settings`
3. Klick: `Environment Variables`
4. Under "User variables", klick `New`:
   - Variable name: `PATH`
   - Variable value: `C:\Users\DEINNAME\AppData\Local\Programs\Python\Python312` (Pfad anpassen!)
5. OK klicken, Computer neustarten

### Lösung 3: Teste Python im Terminal
Öffne CMD und tippe:
```bash
python --version
```

Wenn das funktioniert, musst du nur darauf warten, dass die Batch-Datei funktioniert.

---

## ❌ Problem: "pip not recognized"

Das bedeutet Python ist installiert, aber pip nicht in PATH.

### Lösung:
```bash
python -m pip install -r requirements.txt
```

---

## ❌ Problem: Batch-Datei schließt sich sofort ohne Fehler

### Lösung:
Das ist normal wenn alles funktioniert! Die Batch-Datei startet die Python-App und wartet dann auf CTRL+C. Wenn die App sofort beendet wird:

1. **Öffne sie mit CMD** statt Doppelklick:
   - Öffne Command Prompt (CMD)
   - Navigiere zum Ordner: `cd C:\pfad\zum\ordner`
   - Tippe: `start.bat`
   - Jetzt siehst du die Fehlermeldungen

2. **Häufige Fehler:**
   - `FileNotFoundError: Roblox logs not found` → Roblox läuft nicht
   - `ModuleNotFoundError: requests` → `pip install requests` in CMD ausführen
   - `Permission denied` → CMD als Administrator starten

---

## ❌ Problem: "requests library not found"

### Schnelle Lösung:
1. Öffne CMD als Administrator
2. Tippe:
   ```bash
   pip install requests
   ```
3. Warte bis Installation fertig ist
4. Versuche setup.bat erneut

---

## ❌ Problem: "No Roblox logs found"

Das ist normal und bedeutet nur:
- Roblox läuft nicht
- **Lösung**: Roblox öffnen → Ins Spiel gehen → Dann start.bat starten

---

## 🆘 Immer noch nicht funktioniert?

### Debug-Modus aktivieren:
1. Öffne CMD als Administrator
2. Navigiere zum Ordner:
   ```bash
   cd C:\pfad\zum\Roblox-Sentinel
   ```
3. Starte mit:
   ```bash
   python sentinel.py
   ```

Dies zeigt alle Fehler und Details!

---

## ✅ Wenn alles funktioniert:

Du siehst:
```
[HH:MM:SS] INFO - 🛡️  Roblox Sentinel started
[HH:MM:SS] INFO - Looking for logs at: C:\Users\...\Roblox\logs\*.log
[HH:MM:SS] INFO - 📋 Monitoring: (log file name)
[HH:MM:SS] INFO - Waiting for chat messages...
```

Das ist erfolgreich! Jetzt kann die App laufen, solange Roblox läuft.

---

## 💬 Noch Fragen?

- Öffne ein Issue auf GitHub
- Überprüfe die [README.md](README.md)
- Schau dein Roblox Log-Verzeichnis: `%localappdata%\Roblox\logs\`
