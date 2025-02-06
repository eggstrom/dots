#!/usr/bin/env bash

option=$(printf 'Lock\nShut Down\nReboot\nSuspend\nHibernate' | rofi -dmenu -i -theme-str "* { font: \"JetBrains Mono NF $((FONT_SIZE + 2))\"; }")

case "$option" in
'Lock') ~/.config/i3/lock.sh ;;
'Shut Down') systemctl poweroff ;;
'Reboot') systemctl reboot ;;
'Suspend')
  ~/.config/i3/lock.sh
  systemctl suspend
  ;;
'Hibernate')
  ~/.config/i3/lock.sh
  systemctl hibernate
  ;;
esac
