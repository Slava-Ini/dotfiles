Import-Module helpers -Force

$ScriptName = "setup-essentials.ps1"

function InfoMsg {
    param([string]$Message)
    Info $ScriptName $Message
}

function Install-Scoop {
    param([string]$Package)
    ScoopInstall $Package $ScriptName
}

function Install-Winget {
    param([string]$Package)
    WingetInstall $Package $ScriptName
}

# -- PowerShell update
Install-Winget "Microsoft.PowerShell"

# -- Scoop
InfoMsg "Installing Scoop"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
InfoMsg "Scoop installed"

# -- Starship
Install-Scoop "starship"

# -- SharpKeys
Install-Scoop "sharpkeys"

# -- Lazygit
Install-Scoop "lazygit"

# -- NodeJS
Install-Scoop "nodejs"

# -- TypeScript
InfoMsg "Installing Typescript"
npm install -g typescript
InfoMsg "Typescript installed"

# -- Rust
Install-Scoop "rust"

# -- Odin
InfoMsg "Installing Odin"
scoop bucket add versions 2>&1 | Out-Null
Install-Scoop "odin"

# -- Yazi
InfoMsg "Installing Yazi with optional dependencies"
Install-Scoop "yazi"
Install-Scoop "ffmpeg"
Install-Scoop "7zip"
Install-Scoop "poppler"
Install-Scoop "resvg"
Install-Scoop "imagemagick"
InfoMsg "Yazi with optional dependencies installed"
