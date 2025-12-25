#!/usr/bin/env bash

. ~/.config/bash/xdg.sh

# Default programs
export EDITOR=nvim
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export TERMINAL=foot

# Ensure GPG knows current TTY device file
export GPG_TTY=$(tty)

# Theming
export XCURSOR_THEME=catppuccin-mocha-dark-cursors
export XCURSOR_SIZE=42
export GTK_THEME=catppuccin-mocha-blue-standard+default
export QT_QPA_PLATFORMTHEME=qt6ct

# Colors
eval "$(dircolors)"
export BAT_THEME=base16-256

# fzf
export FZF_DEFAULT_COMMAND='fd -u'
export FZF_CTRL_T_COMMAND='fd -u'
export FZF_ALT_C_COMMAND='fd -utd'
export FZF_DEFAULT_OPTS='
  --bind ctrl-d:delete-char
  --bind ctrl-j:ignore
  --bind ctrl-k:kill-line
  --bind ctrl-o:toggle-up

  --cycle
  --reverse
  --height ~50%
  --no-scrollbar
  --no-separator
  --preview-border sharp

  --prompt "❯ "
  --pointer ▶
  --ellipsis ""
  --color 16,gutter:-1,bg+:-1
  --color current-fg:red,selected-fg:magenta
  --color hl:-1:underline,current-hl:red:underline,selected-hl:magenta:underline
  --color spinner:blue,info:blue
'

# Add paths to $PATH if they're not already present
prepend_path() { [[ ":$PATH:" != *":$1:"* ]] && PATH="$1${PATH:+:$PATH}"; }

prepend_path "$CARGO_HOME/bin"
prepend_path "$GOPATH/bin"
prepend_path ~/.dots/bin

unset -f prepend_path
