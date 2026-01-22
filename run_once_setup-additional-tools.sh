#!/bin/sh

log() {
  sh scripts/linux/log_message.sh "setup-additional-tools.sh" "${1?}"
}

# -- Cpupower
# Note: needs to start a system.d service additionally and configure frequency `/etc/default/cpupower`
# See: https://wiki.archlinux.org/title/CPU_frequency_scaling for details
log "Installing Cpupower"
sudo pacman -Syu --noconfirm cpupower
log "Cpupower installed"
