Import-Module helpers -Force

$ScriptName = "setup-terminal.ps1"

function Install-Scoop {
    param([string]$Package)
    ScoopInstall $Package $ScriptName
}

function Install-Winget {
    param([string]$Package)
    WingetInstall $Package $ScriptName
}

Install-Scoop "zoxide"
Install-Scoop "fzf"
Install-Scoop "ripgrep"
Install-Scoop "fd"
Install-Scoop "sd"
Install-Scoop "tldr"
Install-Scoop "jq"
Install-Scoop "btop"
Install-Winget "thomasschafer.scooter"
Install-Scoop "atac"
Install-Scoop "just"
