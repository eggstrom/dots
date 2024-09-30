#!/usr/bin/env bash

case "$1" in

--desktops-x11-up) xdotool set_desktop --relative 1 ;;
--desktops-x11-down) xdotool set_desktop --relative -- -1 ;;

--desktops-bspwm-up) bspc desktop --focus next.occupied ;;
--desktops-bspwm-down) bspc desktop --focus prev.occupied ;;

--sink-up) pamixer --increase 1 ;;
--sink-down) pamixer --decrease 1 ;;

--source-up) pamixer --default-source --increase 1 ;;
--source-down) pamixer --default-source --decrease 1 ;;

--music-up) mpc --quiet volume +1 ;;
--music-down) mpc --quiet volume -1 ;;

esac
