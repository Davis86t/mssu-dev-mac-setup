#!/usr/bin/env bash
set -euo pipefail

echo "=== MSSU Developer Machine Initialization ==="

# --- Xcode Command Line Tools ---
if ! xcode-select -p >/dev/null 2>&1; then
  echo "[*] Installing Xcode Command Line Tools (may open a popup)..."
  xcode-select --install || true
fi

# --- Homebrew ---
if ! command -v brew >/dev/null 2>&1; then
  echo "[*] Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# --- Folder Structure (WORK-ONLY + SANDBOX) ---
echo "[*] Creating folder structure..."

# Work code
mkdir -p "$HOME/Code/mssu"

# Neutral sandbox for experiments / learning (no client work here)
mkdir -p "$HOME/Sandbox"

# Runtimes / DBs
mkdir -p "$HOME/Dev/java"
mkdir -p "$HOME/Dev/grails"
mkdir -p "$HOME/Dev/databases/postgres"

# Scripts + config
mkdir -p "$HOME/Bin"
mkdir -p "$HOME/.config"

# Work documentation
mkdir -p "$HOME/Projects/mssu"

# --- Homebrew packages ---
echo "[*] Installing Homebrew packages..."

brew install git wget httpie jq tree fzf fd ripgrep zoxide postgresql@16 starship
brew install --cask iterm2 rectangle alt-tab

# --- SDKMAN ---
if [ ! -d "$HOME/.sdkman" ]; then
  echo "[*] Installing SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
fi

# shellcheck disable=SC1090
source "$HOME/.sdkman/bin/sdkman-init.sh"

# --- Java + Grails ---
echo "[*] Installing Java 17 and Grails 6..."

sdk install java 17.0.12-tem || true
sdk default java 17.0.12-tem

sdk install grails 6.0.0 || true
sdk default grails 6.0.0

# --- Apply .zshrc template ---
TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSH_TEMPLATE="$TEMPLATE_DIR/.zshrc.template"
ZSHRC="$HOME/.zshrc"

echo "[*] Applying .zshrc template..."

if [ -f "$ZSH_TEMPLATE" ]; then
  if [ -f "$ZSHRC" ]; then
    BACKUP="$HOME/.zshrc.backup.$(date +%Y%m%d%H%M%S)"
    cp "$ZSHRC" "$BACKUP"
    echo "[*] Existing ~/.zshrc backed up to: $BACKUP"
  fi

  cp "$ZSH_TEMPLATE" "$ZSHRC"
else
  echo "[!] .zshrc.template not found. Skipping shell configuration."
fi

echo
echo "=== Setup Complete ==="
echo "Run: source ~/.zshrc"
