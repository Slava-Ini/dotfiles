#!/bin/sh

log() {
  sh scripts/log_message.sh "setup-additional-tools.sh" "${1?}"
}

# -- Cpupower
log "Installing Cpupower"
sudo pacman -Syu --noconfirm cpupower
log "Cpupower installed"
