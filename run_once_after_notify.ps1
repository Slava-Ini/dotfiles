Import-Module helpers -Force

$ScriptName = "notify.ps1"

function WarnMsg {
    param([string]$Message)
    Warn $ScriptName $Message
}

WarnMsg "Make sure to bind CapsLock to Escape in SharpKeys and reboot"

