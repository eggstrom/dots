#!/usr/bin/env bash

get_brightness() {
	echo "$(("$(brightnessctl get)" * 100 / "$(brightnessctl max)"))"
}

update_brightness() {
	eww update brightness="$(get_brightness)"
}

case "$1" in
--desktops-x11-scroll-up) xdotool set_desktop --relative 1 ;;
--desktops-x11-scroll-down) xdotool set_desktop --relative -- -1 ;;

--desktops-bspwm-scroll-up) bspc desktop --focus next.occupied ;;
--desktops-bspwm-scroll-down) bspc desktop --focus prev.occupied ;;

--sink-scroll-up) pamixer --increase 1 ;;
--sink-scroll-down) pamixer --decrease 1 ;;

--source-scroll-up) pamixer --default-source --increase 1 ;;
--source-scroll-down) pamixer --default-source --decrease 1 ;;

--music-scroll-up) mpc --quiet volume +1 ;;
--music-scroll-down) mpc --quiet volume -1 ;;

--brightness-click)
	brightnessctl set 100% >/dev/null
	update_brightness
	;;
--brightness-rightclick)
	brightnessctl set 1% >/dev/null
	update_brightness
	;;
--brightness-scroll-up)
	brightnessctl set 1%+ >/dev/null
	update_brightness
	;;
--brightness-scroll-down)
	[[ "$(get_brightness)" -gt 1 ]] && brightnessctl set 1%- >/dev/null
	update_brightness
	;;
esac
