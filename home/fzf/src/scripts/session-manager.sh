#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"/..
. helpers/init.sh

export FZF_TITLE='Session Manager'
option height 50%
option header-lines 1
option preview 'tmux capturep -pet {1}'

bind 'start:execute-silent(set_hooks)'
bind 'load:execute-silent(go_to_current)'

bind 'ctrl-r:reload(print_sessions)'
bind 'ctrl-q:execute-silent(tmux kill-session -t {1})'
bind 'ctrl-q:+reload(print_sessions)'

print_sessions() {
  local DATE_FORMAT='%Y-%m-%d %T'
  tmux ls -F \
    "#S,#{?session_attached,Yes,No},#{t/f/$DATE_FORMAT:session_created},#{t/f/$DATE_FORMAT:session_activity}" \
    | column -ts, -N'Name,Attached,Created,Last Activity' -R3,4
}
export -f print_sessions

go_to_current() {
  line="$(tmux ls -F \#S | grep -n "$(tmux display -p \#S)")"
  post "pos(${line%%:*})"
}
export -f go_to_current

post_string() {
  local FZF_PORT="$1"
  echo "curl localhost:$FZF_PORT -XPOST -d"
}
export -f post_string

set_hook() {
  local HOOK="$1"
  local ACTION="$2"
  tmux set-hook -ga "$HOOK" "run '$(post_string "$FZF_PORT")\"$ACTION\"'"
}
export -f set_hook

set_hooks() {
  echo -n "$FZF_PORT" > "$PORT_FILE"
  set_hook session-created 'reload(print_sessions)'
  set_hook session-closed 'reload(print_sessions)'
  set_hook session-renamed 'reload(print_sessions)'
}
export -f set_hooks

unset_hooks() {
  tmux show-hooks -g \
    | grep -F "$(post_string "$(cat "$PORT_FILE")")" \
    | cut -d' ' -f1 \
    | xargs -L1 tmux set-hook -gu
  rm "$PORT_FILE"
}
trap unset_hooks EXIT SIGINT SIGTERM SIGHUP

PORT_FILE="$(mktemp -t fzf-session-manager.XXXXXX)"
export PORT_FILE

session="$(print_sessions | fzf || :)"
if [[ -n "$session" ]]; then
  tmux switch -t "${session%% *}" 2>/dev/null || :
fi
