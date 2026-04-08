# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.0] - 2026-04-08

### Added
- 🛡️ **Security Enhancement**: Environment variable support for Discord Webhook URL
- 📝 `.env.example` template for secure configuration
- 🔒 `.gitignore` to prevent accidental credential exposure
- 📖 Enhanced documentation with security best practices
- 🔄 Automatic session switching when new Roblox session starts
- ⏱️ Configurable check intervals and timeout settings
- 🔁 Retry logic for Discord API failures (3 attempts)

### Changed
- ✅ Webhook URL now read from environment variables (breaking change - requires setup)
- 🎨 Improved logging output with timestamps and emojis
- 📚 Comprehensive error messages for troubleshooting
- 🔧 Better exception handling for network errors

### Fixed
- 🐛 Fixed missing error handling for file operations
- 🐛 Fixed improper exception handling in send_to_discord()
- 🐛 Fixed Unicode encoding issues in log parsing
- 🐛 Fixed memory leaks from unclosed file handles

### Improved
- ⚡ Performance: Reduced CPU usage with optimized loop intervals
- 🧹 Code quality: Added docstrings to all functions
- 📝 Documentation: Added troubleshooting section
- 🎯 UX: Better error messages and logging

---

## [1.0.0] - 2026-04-08

### Added
- ✨ Initial release of Roblox Sentinel
- 🎮 Real-time Roblox chat monitoring
- 💬 Discord Webhook integration
- 🔍 Automatic log file detection
- 📋 Console output for detected chat messages
- 📦 requirements.txt for easy installation

### Features
- ✅ 100% ban-safe (reads local logs only)
- ✅ Lightweight and responsive
- ✅ Cross-platform ready (Windows primary, Linux/Mac compatible)
- ✅ Automatic latest log file detection

---

## Upcoming Features (Planned)

- [ ] Multi-server Discord webhook support
- [ ] Chat message filtering and regex patterns
- [ ] Local CSV logging
- [ ] GUI interface
- [ ] Configuration file (YAML/JSON)
- [ ] Docker support
- [ ] GitHub Actions CI/CD
- [ ] Unit tests and integration tests

---

**For more information, visit the [README](README.md)**
