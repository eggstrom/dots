#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"/..
. helpers/init.sh

export FZF_TITLE='App Launcher'
option exact

print_programs() {
  fd -u --format '{/}' . ${PATH//:/ } 2>/dev/null
}

program="$(print_programs | sort -u | fzf || :)"
if [[ -n "$program" ]]; then
  "$program" >/dev/null 2>&1 & disown
fi
