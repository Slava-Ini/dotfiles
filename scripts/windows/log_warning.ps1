param(
    [Parameter(Mandatory=$true)]
    [string]$Name,

    [Parameter(Mandatory=$true)]
    [string]$Message
)

$logMessage = "[WARNING: $Name] $Message"
$timestamp = Get-Date -Format "dd/MM/yyyy HH:mm:ss"

Write-Host $logMessage -ForegroundColor Yellow

$logEntry = "$timestamp $logMessage"
$logFile = Join-Path $PSScriptRoot "logs.txt"
Add-Content -Path $logFile -Value $logEntry
