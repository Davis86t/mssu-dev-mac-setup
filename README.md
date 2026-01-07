<p align="center">
  <img src="https://img.shields.io/badge/macos-Dev%20Environment-1E1E1E?style=for-the-badge&logo=apple" />
  <img src="https://img.shields.io/badge/Grails-6.0-FF9800?style=for-the-badge&logo=gradle" />
  <img src="https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk" />
  <img src="https://img.shields.io/badge/Oracle-SQL%20Developer-red?style=for-the-badge&logo=oracle" />
</p>

<h1 align="center">📘 MSSU Developer Mac Setup</h1>
<p align="center">A clean, modern, reproducible Java + Grails + SQL development environment for macOS.</p>

---

## 📑 Table of Contents
- [✨ Features](#-features)
- [🚀 Quick Install](#-quick-install)
- [📁 Folder Structure](#-folder-structure)
- [🧪 Validation Checklist](#-validation-checklist)
- [🧠 Manual Install (Optional)](#-manual-install-optional)
- [🔧 Running Your First Project](#-running-your-first-project)
- [🐛 Troubleshooting](#-troubleshooting)
- [🎉 You're Ready](#-youre-ready)

---

## ✨ Features

- One-command environment setup (`init.sh`)
- Installs:
  - Homebrew + essential CLI tools  
  - SDKMAN, Java 17, Grails 6  
  - Oracle SQL Developer (GUI) + SQLcl (CLI)  
  - iTerm2, Rectangle, AltTab  
- Assumes a clean, opinionated development folder layout (documented below) 
- Provides a tuned zsh setup with aliases & quality-of-life improvements  

---

## 🚀 Quick Install

```bash
cd ~/Documents/Code/mssu
git clone https://github.com/Davis86t/mssu-dev-mac-setup
cd mssu-dev-mac-setup

chmod +x init.sh
./init.sh
source ~/.zshrc
```

---

## 📁 Folder Structure

This repository does not create directories automatically.
The layout below documents the recommended local structure only.

**Root:** `~/Documents/`  
(avoids Desktop clutter, OneDrive sync issues, and IT permission problems)

```
~/Documents/
  Code/
    mssu/
      mssu-dev-mac-setup/   # THIS repo — Mac bootstrap & dev environment setup
      <other-repos>/        # MSSU application source code
    personal/               # Personal repos (optional)

  Dev/
    java/                   # JDKs, Java tooling notes, version references
    grails/                 # Grails SDK notes, framework-specific utilities
    databases/
      oracle/               # Oracle client tools, wallets, tnsnames (as permitted)
      postgres/             # Postgres scripts, dumps, local helpers (if needed)

  Projects/
    mssu/                   # Documentation ONLY (architecture notes, runbooks, diagrams)

  Sandbox/                  # Experiments, spikes, learning, throwaway code
  Bin/                      # User-level scripts added to PATH (no sudo)
  config/                   # Tool/app configs you maintain (replacement for ~/.config)
```

### Rules
- **Source code lives in `Code/`**
- **Setup & bootstrap repos live in `Code/mssu/`**
- **Docs never mix with code** → `Projects/`
- **SDKs & tooling ≠ repos** → `Dev/`
- **Nothing runs from OneDrive**
- **No sudo-owned files in your home directory**

---

## 🧪 Validation Checklist

```bash
java -version
grails -version
brew --version
sql -version
```

---

## 🧠 Manual Install (Optional)

### Install Oracle SQL Developer (GUI)
Oracle SQL Developer is used on campus for connecting to Oracle databases (ex: Banner).

1) Download SQL Developer for macOS from Oracle  
2) Extract the zip  
3) Launch the app and create a connection (host / port / service + credentials)

Official downloads:  
https://www.oracle.com/database/sqldeveloper/technologies/download/

> Note: SQLcl (installed by this repo) is the command-line companion to SQL Developer.

---

### Install Xcode Tools
```bash
xcode-select --install
```

### Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Brewfile packages
```bash
brew bundle --file=Brewfile
```

### Install SDKMAN + Java + Grails
```bash
curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh

sdk install java 17.0.12-tem
sdk install grails 6.0.0
```

---

## 🔧 Running Your First Project

```bash
cd ~/Documents/Code/mssu
git clone <repo>
cd <project>
./gradlew bootRun
```

---

## 🐛 Troubleshooting

| Issue | Solution |
|------|----------|
| Grails not found | `source ~/.zshrc` |
| SQL Developer won't launch | Download the macOS build that includes the Oracle JDK |
| Permission denied | `chmod +x gradlew` |

---

## 🎉 You're Ready

Your macOS machine is now fully equipped with:

- Java 17  
- Grails 6  
- Oracle SQL Developer / SQLcl  
- Homebrew tooling  
- A clean, professional folder layout  

Start building. 🚀
