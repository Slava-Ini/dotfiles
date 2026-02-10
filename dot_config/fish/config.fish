# -- Configuration

# - Set the default editor
set -gx EDITOR hx

# - Remove welcome message
set fish_greeting

# - Tmux on startup
if status is-interactive
    and not set -q TMUX
    tmux a || tmux
end

# - Aliasing
alias n="nvim"
alias lg="lazygit"
alias ld="lazydocker"
alias ch="chezmoi"
alias hx="helix"

# - Prompt (# = root, $ = user)
function fish_prompt
    set -l symbol ' $ '
    set -l color $fish_color_cwd

    if fish_is_root_user
        set symbol ' # '
        set -q fish_color_cwd_root
        and set color $fish_color_cwd_root
    end

    set_color $color
    echo -n (prompt_pwd)
    set_color normal
    echo -n (fish_git_prompt)
    echo -n " "

    # TODO: not used now, if not needed - prefer to remove
    # echo -n $symbol
end

# -- Commons

# - Check if WSL
function win_check
    set RELEASE (grep -i Microsoft /proc/sys/kernel/osrelease)

    if test -n "$RELEASE"
        echo WSL
    else
        echo Linux
    end
end

# -- Plugins & Tools

# - NVM Node version
nvm use 22 -s

# - Zoxide
fish_add_path /home/slava/.local/bin

if test (win_check) = WSL
    fish_add_path /mnt/c/Windows/System32
end

zoxide init --cmd cd fish | source

# -- Paths

# - Bin
set -gx PATH $PATH /home/slava/bin
set -gx PATH $PATH $HOME/.local/bin

# - Pnpm
set -gx PNPM_HOME "/home/slava/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

# - Krew (Kubectl) Plugin manager
set -gx PATH $PATH "/home/slava/.krew/bin"

# - Odin
set -gx PATH $PATH "/home/slava/.local/share/odin"

# - Nim
set -ga PATH $PATH "/home/slava/.nimble/bin"

# - JDTLS (see https://github.com/eruizc-dev/jdtls-launcher#)
set -gx PATH $PATH "/home/slava/.local/bin"

# - Gradle
set -gx PATH $PATH "/opt/gradle/gradle-9.1.0/bin"

# - Atac
set -gx ATAC_KEY_BINDINGS "/home/slava/.config/atac/key_bindings.toml"

# - Dotnet
set -gx PATH $PATH "/home/slava/.dotnet/tools"
