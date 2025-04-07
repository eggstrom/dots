#!/usr/bin/env bash

# Creates a bind for both $key and Ctrl + $key
tmux_bind() {
  local key="$1"
  shift
  tmux bind "$key" "$@"
  tmux bind "C-$key" "$@"
}

# Creates a repeating bind
tmux_bind_r() {
  local key="$1"
  shift
  tmux bind -r "$key" "$@"
}

tmux unbind -a

# Pane navigation
tmux_bind Left selectp -L
tmux_bind Down selectp -D
tmux_bind Up selectp -U
tmux_bind Right selectp -R
tmux_bind h selectp -L
tmux_bind j selectp -D
tmux_bind k selectp -U
tmux_bind l selectp -R
tmux_bind Space run-shell 'tmux last || true'

# Pane moving, creation and deletion
tmux_bind m selectp -m
tmux_bind s run-shell 'tmux joinp || tmux splitw -c "#{pane_current_path}"'
tmux_bind v run-shell 'tmux joinp -h || tmux splitw -hc "#{pane_current_path}"'
tmux_bind b breakp -d
tmux_bind q killp

# Pane resizing
tmux_bind_r S-Left resizep -L
tmux_bind_r S-Down resizep -D
tmux_bind_r S-Up resizep -U
tmux_bind_r S-Right resizep -R
tmux_bind_r H resizep -L
tmux_bind_r J resizep -D
tmux_bind_r K resizep -U
tmux_bind_r L resizep -R
tmux_bind   f resizep -Z

# Windows
tmux_bind w neww -c '#{pane_current_path}'
tmux_bind n run-shell 'tmux next || true'
tmux_bind p run-shell 'tmux prev || true'
tmux_bind 1 selectw -t :1
tmux_bind 2 selectw -t :2
tmux_bind 3 selectw -t :3
tmux_bind 4 selectw -t :4
tmux_bind 5 selectw -t :5
tmux_bind 6 selectw -t :6
tmux_bind 7 selectw -t :7
tmux_bind 8 selectw -t :8
tmux_bind 9 selectw -t :9
tmux_bind 0 selectw -t :10

# Sessions
tmux_bind r command-prompt -p 'Session name:' 'run-shell "echo %% | tr \" \" - | xargs tmux rename"'
tmux_bind d detach
tmux_bind a neww tmux-session-manager

# Miscellaneous
tmux_bind e run-shell 'tmux capturep -pS -#{history_limit} | tmux-edit-scrollback #{history_limit}'
tmux_bind c clearhist
tmux_bind . source ~/.config/tmux/tmux.conf
tmux_bind : command-prompt
