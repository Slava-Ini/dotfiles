function Log {
    param([string]$Message)
    & "$PSScriptRoot\scripts\windows\log_message.ps1" "setup-editor.ps1" $Message
}

function Error {
    param([string]$Message)
    & "$PSScriptRoot\scripts\windows\log_message.ps1" "setup-editor.ps1" $Message
}

# -- Install Helix
Log "Installing Helix"
scoop install helix
Log "Helix installed"

# -- Install Typescript Language Server
Log "Installing Typescript LS, Eslint and Prettier"
npm install -g typescript-language-server prettier eslint
Log "Typescript LS, Eslint and Prettier installed"

# -- Install Odin LSP
Log "Installing OLS"
$olsDir = Join-Path $env:TEMP "ols"
$binDir = Join-Path $env:USERPROFILE ".local\bin"

if (Test-Path $olsDir) {
    Remove-Item -Path $olsDir -Recurse -Force
}

git clone https://github.com/DanielGavin/ols.git $olsDir
if (-not $?) {
    Error "Failed to clone OLS"
    exit 1
}

Push-Location $olsDir
& .\build.bat
& .\odinfmt.bat
Pop-Location

if (-not (Test-Path $binDir)) {
    New-Item -ItemType Directory -Path $binDir -Force
}

$olsExe = Join-Path $olsDir "ols.exe"
$odinfmtExe = Join-Path $olsDir "odinfmt.exe"

if (Test-Path $olsExe) {
    Move-Item -Path $olsExe -Destination $binDir -Force
}
if (Test-Path $odinfmtExe) {
    Move-Item -Path $odinfmtExe -Destination $binDir -Force
}

Remove-Item -Path $olsDir -Recurse -Force
Log "OLS installed"

# -- Install Dotnet SDK and Omnisharp
Log "Installing Dotnet SDK and Omnisharp"
scoop install dotnet-sdk
scoop install omnisharp
Log "Dotnet SDK and Omnisharp installed" 
