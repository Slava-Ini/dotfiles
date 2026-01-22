function Log {
    param([string]$Message)
    & "$PSScriptRoot\scripts\windows\log_message.ps1" "setup-essentials.ps1" $Message
}

# -- PowerShell update
Log "Updating PowerShell"
winget install --id Microsoft.PowerShell --source winget
Log "PowerShell Updated"

# -- Scoop
Log "Installing Scoop"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
Log "Scoop installed"

# -- Starship
Log "Installing Starship"
scoop install starship
Log "Starship installed"

# -- Lazygit
Log "Installing Lazygit"
scoop install lazygit
Log "Lazygit installed"

# -- NodeJS
Log "Installing NodeJS"
scoop install nodejs
Log "NodeJS installed"

# -- TypeScript
Log "Installing Typescript"
npm install -g typescript
Log "Typescript installed"

# -- Rust
Log "Installing Rust"
scoop install rust
Log "Rust installed"

# -- Odin
Log "Installing Odin"
scoop bucket add extras
scoop install odin
Log "Odin installed"

# -- Yazi
Log "Installing Yazi with optional dependencies"
scoop install yazi
scoop install ffmpeg 7zip poppler resvg imagemagick
Log "Yazi with optional dependencies installed"
