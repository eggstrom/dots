#!/usr/bin/env bash

S="$(tput sgr0)" # Reset
K="$(tput setaf 0)" # Black
R="$(tput setaf 1)" # Red
G="$(tput setaf 2)" # Green
Y="$(tput setaf 3)" # Yellow
B="$(tput setaf 4)" # Blue
M="$(tput setaf 5)" # Magenta
C="$(tput setaf 6)" # Cyan
W="$(tput setaf 7)" # White
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
  curl localhost:"$FZF_PORT" -XPOST -d"$ACTION";
}
export -f post

nth_step() {
  if [[ ! -v FZF_NTH_MAX ]]; then return; fi
  local STEPS="$1"

  local nth="${FZF_NTH:-..}" # FZF_NTH can be unset at first
  nth="${nth%%.*}" # Trim '..X' and use LHS
  ((nth += STEPS, nth %= FZF_NTH_MAX + 1)) || nth=..

  post "change-nth($nth)"
}
export -f nth_step

option with-shell "$(which bash) -euo pipefail -c"
option listen
option cycle

option reverse
option height ~50%
option preview-border bold
option info-command 'echo "$FZF_INFO$([[ -v FZF_TITLE ]] && echo -n " [$FZF_TITLE]")"'
option no-separator
option no-scrollbar

option prompt '❯ '
option pointer ▶
option ellipsis ''

option color 16
option color gutter:-1,current-bg:-1
option color current-fg:red,selected-fg:magenta
option color hl:yellow:underline,current-hl:yellow:underline
option color nth:dim
option color spinner:blue,info:blue

bind 'ctrl-c:cancel'
bind 'ctrl-d:delete-char'
bind 'ctrl-t:toggle-preview'
bind 'alt-n:execute-silent(nth_step +1)'
bind 'alt-p:execute-silent(nth_step -1)'
