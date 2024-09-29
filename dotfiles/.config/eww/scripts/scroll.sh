#!/usr/bin/env bash

case "$1" in

--sink-up) pamixer --increase 1 ;;
--sink-down) pamixer --decrease 1 ;;

--source-up) pamixer --default-source --increase 1 ;;
--source-down) pamixer --default-source --decrease 1 ;;

--music-up) mpc volume +1 ;;
--music-down) mpc volume -1 ;;

esac
