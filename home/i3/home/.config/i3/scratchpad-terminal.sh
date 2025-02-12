#!/usr/bin/env bash
set -euo pipefail

if ! i3-msg scratchpad show; then
  i3-msg \
    '[class=scratchpad-terminal]' move to scratchpad \
    '[class=scratchpad-terminal]' move to workspace current \
    '[class=scratchpad-terminal]' focus
fi

if [[ "$(xdotool getactivewindow getwindowclassname)" = scratchpad-terminal ]]; then
  read -r width height <<<"$(xdotool getdisplaygeometry)"
  ((w = width * 8 / 10))
  ((h = height * 8 / 10))
  ((x = (width - w) / 2))
  ((y = (height - h) / 2))
  i3-msg move position $x $y, resize set $w $h
fi
