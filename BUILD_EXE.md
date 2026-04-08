# Build Roblox Sentinel as Standalone .exe

This guide explains how to create a standalone `.exe` file so you don't need to worry about Python at all!

## Option 1: Using PyInstaller (Recommended)

### Step 1: Install PyInstaller
```bash
pip install pyinstaller
```

### Step 2: Build the .exe
```bash
pyinstaller --onefile --icon=sentinel.ico --name "Roblox Sentinel" sentinel.py
```

This creates a single `.exe` file in the `dist/` folder.

### Step 3: Use the .exe
- Find `Roblox Sentinel.exe` in the `dist/` folder
- Double-click to run it!
- No Python installation needed

---

## Option 2: Using Auto-py-to-exe (Visual GUI)

### Step 1: Install Auto-py-to-exe
```bash
pip install auto-py-to-exe
```

### Step 2: Open the GUI
```bash
auto-py-to-exe
```

### Step 3: Configure
- Select `sentinel.py` as the script
- Choose "One File" option
- Click "CONVERT .PY TO .EXE"

---

## Option 3: Quick Build (No Icon)

Simplest method without icons:

```bash
pip install pyinstaller
pyinstaller --onefile --windowed sentinel.py
```

---

## Generated Files

After building, you'll find:
- `dist/Roblox Sentinel.exe` — The standalone executable
- `build/` — Temporary build files (can be deleted)
- `Roblox Sentinel.spec` — Build configuration (can be deleted)

---

## Distributing the .exe

Once you have the `.exe` file, you can:

1. **Share it directly** on GitHub releases
2. **Create an installer** using NSIS or Inno Setup
3. **Zip it** for easy download

### Quick Zip for Distribution:
```bash
# Copy necessary files
copy dist\Roblox Sentinel.exe .\
copy requirements.txt .\
copy README.md .\
copy .env.example .\

# Zip everything
# On Windows, right-click > Send to > Compressed folder
```

---

## Troubleshooting

### "...is not recognized as an internal or external command"
- Python is not in PATH
- Reinstall Python and check "Add Python to PATH"

### Antivirus warns about .exe
- This is normal for PyInstaller
- File is safe, it's just packed Python code

### .exe is very large (100+ MB)
- This is normal - it includes the Python runtime
- Use `--onefile` option (already in examples above)

---

## Creating a Professional Installer (Optional)

For a professional installer, use **Inno Setup**:

1. Download: https://jrsoftware.org/isinfo.php
2. Create a `.iss` script file
3. Compile to `.exe` installer

This creates a professional installer that users can run.

---

**For now, just use `start.bat` - it's simpler and works great!**
