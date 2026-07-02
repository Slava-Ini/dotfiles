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
  - k <key/click/menu-item> - key 
  - f <function> - function 
  - m <mode> - mode 
  - c <shortcut> - shortcut typed
  - x <command> - command name
  - o <symbol> - any name
  - t - start built-in tutorial 
  - b - show all shortcuts
  - a - regex search for apropos-command (M-x commands)
  - i / r - info documentation browser
  - ? - list available help options
- <shortcut> C-h - find global bindings starting with <shortcut>

> Note: <tab> shows available options

#### Search & Replace

- C-s / C-r — Jump to the next or previous occurrence

#### Windows Managment

> Windows

- C-x - global prefix
  - 0 - close current active window
  - 2 - split pane horizontally into two stacked windows
  - 3 - =//= vertically
  - 1 - close all window splits except the active one
  - 4 f (or 4 C-f) - find file in other window
  - o - cycle through windows
- C-M
  v - scroll the bottom window

> Frames

- C-x
  - 5 2 - create new frame
  - 5 0 - close frame


#### Buffers

- C-x
  - C-b - list buffers
  - s   - save some buffers to theeir files (prompted which ones to save)
  - b   - switch buffer (can switch to `*Messages*` buffer as well)
   
#### File & System

- C-x - global prefix
  - C-o - open or create a file
  - C-s - save current buffer
  - C-f - prompts to find a file in minibuffer
  - C-w - write a buffer to a specific file name
  - C-c - close and exits editor

  - u - undo the last command

#### Selection & Text

- Any motion suffix with shift - shift selection mode (`shift-select-mode`)

#### Code

- C-M-i - code completion

#### Bookmarks

- C-x r
  - l - list bookmarks
  - m - set bookmark
  - b - jump to a bookmark

#### Evaluation & Commands

- M-x <command-name> - execute a command
  - replace-string - replaces prompted text
  - recover-this-file - recovers auto-saved file
  - auto-fill-mode - toggle the minor mode on/off
  - list-packages - see emacs community packages
- C-x
  - C-e - evaluate an expression in a text (`eval-last-sexp`), cursor right after the command
  - M-: - repeat complex command
  - f   - set fill-column (for `auto-fill-break` minor mode)
- M-q  - re-fill (according to `auto-fill-break`)
- M-: - eval an expression (inserted)
- C-j - eval an expression in a text and append output to the next line
- C-M-x = C-x C-e


#### Mini Buffers

- l / r - go back to previous / next visited page
- n / p - got next / previous page according to menu layout
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
