#!/bin/bash

log() {
  sh scripts/log_message.sh "setup-essentials.sh" "${1?}"
}

# -- Lazygit
log "Installing Lazygit"
sudo pacman -Syu --noconfirm lazygit
log "Lazygit installed"

# -- Docker
log "Installing Docker"
sudo pacman -S --noconfirm docker
log "Docker installed"

# -- Docker Compose
log "Installing Docker Compose"
sudo pacman -S --noconfirm docker-compose
log "Docker Compose installed"
   
# -- Docker Configuration
log "Configuring Docker"
sudo groupadd docker
sudo usermod -aG docker "$USER"
sudo systemctl restart docker
log "Docker configured"

# -- Asian Fonts (Arch)
log "Installing Asian Fonts"
sudo pacman -S noto-fonts-cjk
log "Asian Fonts installed"

# -- Mono Nerd Font
log "Installing Jetbrains Mono Nerd Font"
sudo pacman -S ttf-jetbrains-mono-nerd
log "Jetbrains Mono Nerd Font installed"

# -- Lazy Docker
log "Installing LazyDocker"
sudo pacman -S --noconfirm lazydocker
log "LazyDocker installed"
   
# -- NodeJS
log "Installing NodeJS"
sudo pacman -S --noconfirm nodejs
log "NodeJS installed"

# -- TypeScript
log "Installing Typescript"
sudo pacman -S --noconfirm typescript
log "Typescript installed"

# -- Rust
log "Installing Rust"
sudo pacman -S --noconfirm rust
log "Rust installed"

# -- Odin
log "Installing Odin"
sudo pacman -S --noconfirm odin
log "Odin installed"

# -- Yarn
log "Installing Yarn"
sudo pacman -S --noconfirm yarn
log "Yarn installed"

# -- Yazi
log "Installing Yazi"
sudo pacman -S --noconfirm yazi
log "Yazi installed"
