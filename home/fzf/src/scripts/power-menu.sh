#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"/..
. helpers/init.sh

export FZF_TITLE='Power Menu'
option with-nth 2..

options=(
  Lock
  Exit
  'Shut Down'
  Reboot
  Suspend
  Hibernate
)
commands=(
  "$XDG_CONFIG_HOME/i3/lock.sh"
  'i3-msg exit'
  'systemctl poweroff'
  'systemctl reboot'
  "$XDG_CONFIG_HOME/i3/lock.sh; systemctl suspend"
  "$XDG_CONFIG_HOME/i3/lock.sh; systemctl hibernate"
)

index="$(printf '%s\n' "${options[@]}" | cat -n | fzf || :)"
if [[ -n "$index" ]]; then
  "${commands["${index%% *}"]}"
fi
