#!/bin/sh

log() {
  sh scripts/log_message.sh "setup_editor.sh" "${1?}"
}

error() {
  sh scripts/log_error.sh "setup_editor.sh" "${1?}"
}

# Install Helix
log "Installing Helix"
sudo pacman -Syu --noconfirm helix
log "Helix installed"

# Install Typescript Language Server
log "Installing Typescript LS, Eslint and Prettier"
sudo pacman -S --noconfirm typescript-language-server
sudo pacman -S --noconfirm eslint
sudo pacman -S --noconfirm prettier
log "Typescript LS, Eslint and Prettier installed"

# Install Odin LSP
log "Installing OLS"
git clone https://github.com/DanielGavin/ols.git
cd ols || (error "Failed to clone OLS" && exit 1)
./build.sh
./odinfmt.sh
if [ -d "$HOME/.local/bin/ols" ]; then
  log "OLS already installed, updating..."
  sudo rm -rf "$HOME/.local/bin/ols"
fi
if [ -d "$HOME/.local/bin/odinfmt" ]; then
  log "OdinFmt already installed, updating..."
  sudo rm -rf "$HOME/.local/bin/odinfmt"
fi
mv ols odinfmt "$HOME/.local/bin/"
cd ..
rm -rf ols
log "OLS installed"

# Install Markdown Oxide
log "Installing Markdown Oxide"
sudo pacman -Syu --noconfirm markdown-oxide
log "Markdon Oxide installed" 

