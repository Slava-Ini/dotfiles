#!/bin/bash

warn() {
  sh scripts/log_warning.sh "notify.sh" "${1?}"
}

warn "Run 'prefix + I' to install Tmux plugins"
warn "Don't forget to restart the terminal"
