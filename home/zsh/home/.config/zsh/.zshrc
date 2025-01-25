. ~/.config/shell/aliases.sh
. ~/.config/shell/env.sh

# Change directory using Yazi
f() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    cwd="$(cat -- "$tmp")" && [[ -n "$cwd" ]] && [[ "$cwd" != "$PWD" ]] &&
        builtin cd -- "$cwd"
    \rm -f -- "$tmp"
}

# Quickly evaluate a Python expression
py() {
    local result="$(python <<< "from math import *; from random import *; print($*)")"
    [[ -n "$result" ]] &&
        echo "$result"
}
alias py='noglob py'

# Fuzzy find man pages
fman() {
    local result="$(man -k . | cut -d ' ' -f '1-2' | fzf)"
    man \
        "${"$(echo "$result" | cut -d ' ' -f '2')":1:-1}" \
        "$(echo "$result" | cut -d ' ' -f '1')"
}

# Directory options
setopt auto_cd           # Change directory without cd
setopt auto_pushd        # Push visited directories onto stack
setopt pushd_ignore_dups # Prevent duplicate directories in stack

# History options
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt share_history

# Miscellaneous options
setopt glob_dots  # Show dotfiles during expansion
setopt no_clobber # Don't overwrite files when redirecting

# Keybinds
bindkey '^?'      backward-delete-char  # Backspace
bindkey '^[[3~'   delete-char           # Delete
bindkey '^[[H'    beginning-of-line     # Home
bindkey '^[[F'    end-of-line           # End
bindkey '^[[1;5C' forward-word          # Ctrl + Right
bindkey '^[[1;5D' backward-word         # Ctrl + Left
bindkey '^H'      backward-kill-word    # Ctrl + Backspace
bindkey '^[[3;5~' kill-word             # Ctrl + Delete
bindkey '^[[Z'    reverse-menu-complete # Shift + Tab

# Change cursor to bar
zle-line-init() { echo -en '\e[6 q'; }

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                      # Enable highlight on selected item
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Enable file colors

# Enable plugins and integration
. ~/.local/state/nix/profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. ~/.local/state/nix/profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
