[[ ! $(pgrep udiskie) ]] &&
    udiskie &

[[ -z "$DISPLAY" ]] && [[ "$XDG_VTNR" = '1' ]] &&
    startx
