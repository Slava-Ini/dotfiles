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
- Improve cross-platform templates (via folders?) so it's more obvious what is shared
- Make alacritty a template depending on WSL/Ubuntu
- Cleanup fish stuff
- Remove redundancy:
  - Markdown lsp in helix.toml (switched to markdown oxide?)


## Emacs

### Shorcuts

#### Help

- C-h - help prefix (Describe)
  - v <variable> - variable 
  - k <shortcut> - key 
  - f <function> - function 
  - m <mode> - mode 
  - t - start built-in tutorial 
  - b - show all shortcuts
  - a - regex search for apropos-command
  - i - info documentation browser

> Note: <tab> shows available options

#### Search

- C-s / C-r — Jump to the next or previous occurrence

#### Windows Managment

- C-x - global prefix
  - 0 - close current active window
  - 2 - split pane horizontally into two stacked windows
  - 3 - =//= vertically
  - 1 - close all window splits except the active one
  - o - cycle through windows
   
#### File & System

- C-x - global prefix
  - C-o - open or create a file
  - C-s - save current buffer
  - C-f - prompts to find a file in minibuffer
  - C-w - write a buffer to a specific file name
  - C-c - close and exits editor

  - u - undo the last command

#### Navigation

##### Bookmarks

- C-x r
  - l - list bookmarks
  - m - set bookmark
  - b - jump to a bookmark

#### Evaluation & Commands

- M-x <command-name> - execute a command
- C-x
  - C-e - evaluate a command in a file (`eval-last-sexp`), cursor right after the command
  - M-: - repeat complex command
- M-: - eval an expression

#### Mini Buffers

- l / r - go back to previous / next help page
- tab - cycle hyperlinks

#### Text

- C-M-f / C-M-b - move forward/bacword between the pairs

### Notes

4. Modern Upgrades (Highly Recommended)The default Emacs completion list can feel clunky. Most Emacs users install a modern "completion framework" that shows a live, searchable dropdown list the second you press C-h v or C-h f.Popular options include:Vertico: A minimalist, vertical completion list.Ivy: A highly interactive search selection framework.Helm: A powerful, feature-rich visual tool.

### Plugins

- [Qick jump Helix-like](https://github.com/abo-abo/avy)

### Links

- [Explore Setup](https://www.youtube.com/watch?v=n5VMWuxLi10)

### Config TODO

- Remove blinking when reaching document start/end
- Make scroll half the page (also retain the cursor in the middle of the line?)
- [Bookmark idea](https://www.reddit.com/r/emacs/comments/4ykg7s/comment/d6pjfsk/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
