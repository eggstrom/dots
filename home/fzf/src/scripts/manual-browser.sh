#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"/..
. helpers/init.sh

export FZF_TITLE='Manual Browser'
export FZF_NTH_MAX=2
option header-lines 1
option preview 'man {1} {2} 2>/dev/null'

bind 'enter:execute(man {1} {2})'
bind 'ctrl-r:reload(print_pages)'

print_pages() {
  man -k . | sed -E "s/^(\S*) \((\S*)\).*/\2$D\1/" | sort | print_columns Section,Page 1
}
export -f print_pages

print_pages | fzf || :
