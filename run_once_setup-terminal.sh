#!/bin/bash

log() {
  sh scripts/log_message.sh "setup-terminal.sh" "${1?}"
}

# -- Alacritty
log "Installing Alacritty"
sudo pacman -Syu --noconfirm alacritty
log "Alacritty installed"

# -- Tmux
log "Installing Tmux"
sudo pacman -S --noconfirm tmux
log "Tmux installed"

# -- Tmux Plugin Manager
log "Installing Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
log "Tmux Plugign Manager installed"

# -- Fish
log "Installing Fish"
sudo pacman -S --noconfirm fish
chsh -s "$(which fish)"
log "Fish installed and set as a default shell"

# -- Zoxide
log "Installing Zoxide"
sudo pacman -S --noconfirm zoxide
log "Zoxide installed"

# -- Fzf
log "Installing Fzf"
sudo pacman -S --noconfirm fzf
log "Fzf installed"

# -- Ueberzug (Yazi preview)
log "Installing Ueberzug"
sudo pacman -S --noconfirm ueberzug
log "Ueberzug installed"

# -- Ripgrep
log "Installing Ripgrep"
sudo pacman -S --noconfirm ripgrep
log "Ripgrep installed"

# -- Tldr
log "Installing Tldr"
sudo pacman -S --noconfirm tldr
log "Tldr installed"

# -- Tree
log "Installing Tree"
sudo pacman -S --noconfirm tree
log "Tree installed"

# -- Xclip
log "Installing Xclip"
sudo pacman -S --noconfirm xclip
log "Xclip installed"

# -- Jq
log "Installing Jq"
sudo pacman -S --noconfirm jq
log "Jq installed"

# -- Btop
log "Installing Btop"
sudo pacman -S --noconfirm btop
log "Btop installed"

