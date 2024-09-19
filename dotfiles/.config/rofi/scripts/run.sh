#!/usr/bin/env bash

rofi -modes 'run,window' -show 'run' -theme 'run' \
    -display-run 'Run: ' -display-window 'Window: ' \
    -no-custom -no-sort -disable-history \
    -run-command "$HOME/.config/rofi/scripts/run-command.sh {cmd}" \
