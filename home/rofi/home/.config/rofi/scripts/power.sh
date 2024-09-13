#!/usr/bin/env bash

option=$(printf '\n\n\n\n\n' | rofi -dmenu -theme 'power')

case "$option" in
    '') ~/.config/i3/lock.sh ;;
    '') i3-msg exit ;;
    '') systemctl poweroff ;;
    '') systemctl reboot ;;
    '') ~/.config/i3/lock.sh; systemctl suspend ;;
    '') ~/.config/i3/lock.sh; systemctl hibernate ;;
esac
