# TODO list

## Windows

- Configure `.gitconfig`
  - Remove working things - template or separate file
- Make it so Windows Terminal configs are also in dotfiles
  - Font
- Fix yazi (helix)
  - First tackle the issue with `file` - see [yazi docs](https://yazi-rs.github.io/docs/installation/#windows) and potential [plugin solution](https://github.com/yazi-rs/plugins/tree/main/mime-ext.yazi)
- Fix btop config
- Atac - set vim key bindings via config
- Scooter - make escape shortcut better for both Windows and Linux

## Other 

- If `csharp-ls` works great on windows and dotnet 9 [info](https://github.com/razzmatazz/csharp-language-server)
  Change `omnisharp` to it in the scripts `dotnet tool install --global csharp-ls`, probably env variable also required on Windows (`fish` is already done)
- Improve cross-platform templates (via folders?) so it's more obvious what is shared
- Make alacritty a template depending on WSL/Ubuntu
- Cleanup fish stuff
- Remove redundancy:
  - Markdown lsp in helix.toml (switched to markdown oxide?)

