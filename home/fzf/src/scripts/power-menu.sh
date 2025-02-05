#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"/..
. helpers/init.sh

export FZF_TITLE='Power Menu'
option with-nth 2
bind 'enter:become(echo {1})'

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

index="$(printf '%s\n' "${options[@]}" | nl -w1 -v0 -s"$D" | fzf || :)"
if [[ -n "$index" ]]; then
  eval "${commands[index]}"
fi
