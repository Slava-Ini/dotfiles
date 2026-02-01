# Aliasing
Set-Alias -Name lg -Value lazygit
Set-Alias -Name ld -Value lazydocker
Set-Alias -Name ch -Value chezmoi
Set-Alias -Name hx -Value helix

# Env
$YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"
$env:DOTNET_ROOT = "C:\Program Files\dotnet"
$env:Path += ";C:\Users\slava\AppData\Local/avalonia-ls"

# Startship
Invoke-Expression (&starship init powershell)

# Zoxide
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })


# Utils
function which($cmd)
{
  $command = Get-Command $cmd -ErrorAction SilentlyContinue

  if (-not $command) {
      Write-Host "Command not found: $cmd" -ForegroundColor Red
      return
  }

  if ($command.CommandType -eq 'Alias') {
      $command = Get-Command $command.ResolvedCommandName
  }

  $command.Source
}

# Prompt (for correct splitMode functioning with starship)
function Invoke-Starship-PreCommand {
  $loc = $executionContext.SessionState.Path.CurrentLocation;
  $prompt = "$([char]27)]9;12$([char]7)"
  if ($loc.Provider.Name -eq "FileSystem")
  {
    $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $host.ui.Write($prompt)
}
