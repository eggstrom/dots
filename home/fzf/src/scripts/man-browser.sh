#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"/..
. helpers/init.sh

export FZF_TITLE='Man Browser'
option header-lines 1
option preview 'man {1} {2}'

bind 'enter:execute(man {1} {2})'
bind 'ctrl-r:reload(print_pages)'

print_pages() {
  man -k . | sed -E 's/^(\S*) \((\S*)\).*/\2 \1/' | column -tNSection,Page -R1
}
export -f print_pages

print_pages | fzf || :
