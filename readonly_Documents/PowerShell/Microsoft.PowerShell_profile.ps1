# Aliasing
Set-Alias -Name lg -Value lazygit
Set-Alias -Name ld -Value lazydocker
Set-Alias -Name ch -Value chezmoi
Set-Alias -Name hx -Value helix

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
