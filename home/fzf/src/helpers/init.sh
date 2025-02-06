#!/usr/bin/env bash

S="$(tput sgr0)"    # Reset
K="$(tput setaf 0)" # Black
R="$(tput setaf 1)" # Red
G="$(tput setaf 2)" # Green
Y="$(tput setaf 3)" # Yellow
B="$(tput setaf 4)" # Blue
M="$(tput setaf 5)" # Magenta
C="$(tput setaf 6)" # Cyan
W="$(tput setaf 7)" # White
D=$'\x01'           # Delimiter
export S K R G Y B M C W D

option() {
  FZF_DEFAULT_OPTS+=$'\n'--"$1"
  if [[ "$#" -gt 1 ]]; then
    FZF_DEFAULT_OPTS+=" '${*:2}'"
  fi
}
export -f option

bind() {
  option bind "$@"
}
export -f bind

post() {
  ACTION="$1"
  curl localhost:"$FZF_PORT" -XPOST -d"$ACTION"
}
export -f post

print_columns() {
  local COLUMNS="$1"
  local RIGHT_ALIGNED="${2:-,}"
  cat | column -ts"$D" -o" $D " -N"$COLUMNS" -R"$RIGHT_ALIGNED",
}
export -f print_columns

change_nth() {
  if [[ ! -v FZF_NTH_MAX ]]; then return; fi
  local STEPS="$1"

  local nth="${FZF_NTH:-..}" # FZF_NTH can be unset at first
  nth="${nth%%.*}"           # Trim '..X' and use LHS
  ((nth += STEPS, nth %= FZF_NTH_MAX + 1)) || nth=..

  post "change-nth($nth)"
}
export -f change_nth

change_preview_size() {
  local STEPS="$1"
  local size=$((FZF_PREVIEW_COLUMNS + STEPS))
  if [[ "$size" -lt 1 ]]; then size=1; fi

  post "change-preview-window($size)"
}
export -f change_preview_size

option with-shell "$(which bash) -euo pipefail -c"
option listen
option cycle

option reverse
option height ~50%
option info-command 'echo "$FZF_INFO$([[ -v FZF_TITLE ]] && echo -n " [$FZF_TITLE]")"'
option no-separator
option no-scrollbar
option delimiter "$D"
option preview-border bold

option prompt '❯ '
option pointer ▶
option ellipsis ''

option color 16
option color gutter:-1,current-bg:-1
option color current-fg:red,selected-fg:magenta
option color hl:yellow:underline,current-hl:yellow:underline
option color nth:dim
option color spinner:blue,info:blue

bind ctrl-c:cancel
bind ctrl-d:delete-char
bind ctrl-j:jump
bind ctrl-k:kill-line
bind tab:toggle
bind shift-tab:toggle

bind 'alt-h:execute-silent(change_preview_size +1)'
bind alt-j:preview-down
bind alt-k:preview-up
bind 'alt-l:execute-silent(change_preview_size -1)'
bind alt-t:toggle-preview

bind 'alt-n:execute-silent(change_nth +1)'
bind 'alt-p:execute-silent(change_nth -1)'
