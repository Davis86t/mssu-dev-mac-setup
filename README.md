<p align="center">
  <img src="https://img.shields.io/badge/macos-Dev%20Environment-1E1E1E?style=for-the-badge&logo=apple" />
  <img src="https://img.shields.io/badge/Grails-6.0-FF9800?style=for-the-badge&logo=gradle" />
  <img src="https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk" />
  <img src="https://img.shields.io/badge/PostgreSQL-16-316192?style=for-the-badge&logo=postgresql" />
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
  - PostgreSQL 16  
  - iTerm2, Rectangle, AltTab  
- Creates a clean development folder layout  
- Provides a tuned zsh setup with aliases & quality-of-life improvements  

---

## 🚀 Quick Install

```bash
cd ~
git clone https://github.com/Davis86t/mssu-dev-mac-setup
cd mssu-dev-mac-setup

chmod +x init.sh
./init.sh
source ~/.zshrc
```

---

## 📁 Folder Structure

```
~/Code/
    mssu/         # project repos

~/Sandbox/        # experiments, scratch work, learning

~/Dev/
    java/
    grails/
    databases/
        postgres/

~/Bin/
~/.config/

~/Projects/
    mssu/         # documentation, architecture notes
```

---

## 🧪 Validation Checklist

```bash
java -version
grails -version
brew --version
pgstatus
```

---

## 🧠 Manual Install (Optional)

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
cd ~/Code/mssu
git clone <repo>
cd <project>
./gradlew bootRun
```

---

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| Grails not found | `source ~/.zshrc` |
| PostgreSQL won't start | `pgstop && pgstart` |
| Permission denied | `chmod +x gradlew` |

---

## 🎉 You're Ready

Your macOS machine is now fully equipped with:

- Java 17  
- Grails 6  
- PostgreSQL 16  
- Homebrew tooling  
- A polished zsh environment  

Start building. 🚀

