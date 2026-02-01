Import-Module helpers -Force

$ScriptName = "setup-editor.ps1"

function InfoMsg {
    param([string]$Message)
    Info $ScriptName $Message
}

function ErrorMsg {
    param([string]$Message)
    Error $ScriptName $Message
}

function Install-Scoop {
    param([string]$Package)
    ScoopInstall $Package $ScriptName
}

# -- Install Helix
Install-Scoop "helix"

# -- Install Typescript Language Server, Eslint and Prettier
NpmInstall "typescript-language-server" $ScriptName
NpmInstall "prettier" $ScriptName
NpmInstall "eslint" $ScriptName

# -- Install Odin LSP
InfoMsg "Installing OLS"
$olsDir = Join-Path $env:TEMP "ols"
$binDir = Join-Path $env:USERPROFILE ".local\bin"

if (Test-Path $olsDir) {
    Remove-Item -Path $olsDir -Recurse -Force
}

git clone https://github.com/DanielGavin/ols.git $olsDir
if (-not $?) {
    ErrorMsg "Failed to clone OLS"
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
InfoMsg "OLS installed"

# -- Install Dotnet SDK and CSharp LS
InfoMsg "Installing Dotnet SDK and CSharp LS"
Install-Scoop "dotnet-sdk"
dotnet tool install --global csharp-ls
InfoMsg "Dotnet SDK and CSharp LS installed"

# -- Install Avalonia LS
InfoMsg "Installing Avalonia LS"
$avaloniaLsDir = Join-Path $env:TEMP "ls-for-avalonia"

if (Test-Path $avaloniaLsDir) {
    Remove-Item -Path $avaloniaLsDir -Recurse -Force
}

git clone https://www.github.com/eugenenoble2005/ls-for-avalonia.git $avaloniaLsDir --recursive
if (-not $?) {
    ErrorMsg "Failed to clone Avalonia LS"
    exit 1
}

Push-Location $avaloniaLsDir
just install
Pop-Location

Remove-Item -Path $avaloniaLsDir -Recurse -Force
InfoMsg "Avalonia LS installed"
