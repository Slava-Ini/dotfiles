function Warn {
    param([string]$Message)
    & ".\scripts\windows\log_warning.ps1" "notify.ps1" $Message
}

Warn "Make sure to bind CapsLock to Escape in SharpKeys and reboot"

