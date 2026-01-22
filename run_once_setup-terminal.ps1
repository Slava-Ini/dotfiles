function Log {
    param([string]$Message)
    & ".\scripts\windows\log_message.ps1" "setup-terminal.ps1" $Message
}

# -- Zoxide
Log "Installing Zoxide"
scoop install zoxide
Log "Zoxide installed"

# -- Fzf
Log "Installing Fzf"
scoop install fzf
Log "Fzf installed"

# -- Ripgrep
Log "Installing Ripgrep"
scoop install ripgrep
Log "Ripgrep installed"

# -- Fd
Log "Installing Fd"
scoop install fd
Log "Fd installed"

# -- Sd
Log "Installing Sd"
scoop install sd
Log "Sd installed"

# -- Tldr
Log "Installing Tldr"
scoop install tldr
Log "Tldr installed"

# -- Jq
Log "Installing Jq"
scoop install jq
Log "Jq installed"

# -- Btop
Log "Installing Btop"
scoop install btop
Log "Btop installed"

# -- Scooter
Log "Installing Scooter"
winget install thomasschafer.scooter
Log "Scooter installed"

# -- Atac
Log "Installing Atac"
scoop install atac
Log "Atac installed"
