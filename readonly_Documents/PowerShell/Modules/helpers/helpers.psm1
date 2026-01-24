enum Color {
    Red
    Cyan
    Yellow
}

enum Level {
    INFO
    WARNING
    ERROR
}

function Log {
    param(
        [Parameter(Mandatory=$true)]
        [Level]$Level,

        [Parameter(Mandatory=$true)]
        [Color]$Color,

        [Parameter(Mandatory=$true)]
        [string]$Name,

        [Parameter(Mandatory=$true)]
        [string]$Message
    )

    
    $logMessage = "[$($Level.toString()): $Name] $Message"
    $timestamp = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
    
    Write-Host $logMessage -ForegroundColor $Color.ToString()

    $logEntry = "$timestamp $logMessage"
    $logFile = Join-Path $PSScriptRoot "logs.txt"
    Add-Content -Path $logFile -Value $logEntry
}

function Info {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,

        [Parameter(Mandatory=$true)]
        [string]$Message
    )

    Log INFO Cyan $Name $Message
}

function Warn {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,

        [Parameter(Mandatory=$true)]
        [string]$Message
    )

    Log WARNING Yellow $Name $Message
}

function Error {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,

        [Parameter(Mandatory=$true)]
        [string]$Message
    )

    Log ERROR Red $Name $Message
}

function ScoopInstall {
    param(
        [Parameter(Mandatory=$true)]
        [string]$PackageName,

        [Parameter(Mandatory=$true)]
        [string]$ScriptName
    )

    # Check if package is already installed using `scoop which`
    scoop which $PackageName *>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Info $ScriptName "$PackageName already installed, skipping"
        return
    }
    
    # Check if package is installed but with different binary name
    $packageInfo = scoop info $PackageName
    if ($packageInfo.Installed) {
        Info $ScriptName "$PackageName already installed, skipping"
        return
    }
     
    Info $ScriptName "Installing $PackageName"
    scoop install $PackageName 2>&1 | Out-Null
    Info $ScriptName "$PackageName installed"
}

function WingetInstall {
    param(
        [Parameter(Mandatory=$true)]
        [string]$PackageId,

        [Parameter(Mandatory=$true)]
        [string]$ScriptName
    )

    # Check if package is already installed
    $checkOutput = winget list --id $PackageId 2>&1 | Out-String

    if ($checkOutput -match [regex]::Escape($PackageId)) {
        Info $ScriptName "$PackageId already installed, skipping"
    } else {
        Info $ScriptName "Installing $PackageId"
        winget install $PackageId --silent 2>&1 | Out-Null
        Info $ScriptName "$PackageId installed"
    }
}

Export-ModuleMember -Function Info, Warn, Error, ScoopInstall, WingetInstall
