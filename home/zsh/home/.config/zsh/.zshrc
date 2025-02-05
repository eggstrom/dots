. ~/.config/shell/aliases.sh
. ~/.config/shell/env.sh

# Enable integration
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# Change directory using Yazi
f() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    cwd="$(cat -- "$tmp")" && [[ -n "$cwd" ]] && [[ "$cwd" != "$PWD" ]] &&
        builtin cd -- "$cwd"
    \rm -f -- "$tmp"
}

create_fzf_bind() {
  eval "fzf-$2() { command fzf-$2; }"
  zle -N fzf-"$2"
  bindkey "^[$1" fzf-"$2"
}
create_fzf_bind r app-launcher
create_fzf_bind c calculator
create_fzf_bind m manual-browser
create_fzf_bind p music-player
create_fzf_bind q power-menu
unset -f create_fzf_bind

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

# Source plugins
. ~/.local/state/nix/profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. ~/.local/state/nix/profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
