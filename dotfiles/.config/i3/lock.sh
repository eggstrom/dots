#!/usr/bin/env bash

background='1E1E2EF2'
foreground='CDD6F4'
green='A6E3A1'
red='F38BA8'
yellow='F9E2AF'

i3lock -ec '00000000' \
    --inside-color="$background" \
    --insidever-color="$background" \
    --insidewrong-color="$background" \
    \
    --ring-color="$foreground" \
    --ringver-color="$yellow" \
    --ringwrong-color="$red" \
    \
    --separator-color="$foreground" \
    --keyhl-color="$green" \
    --bshl-color="$red" \
    \
    --line-uses-inside \
    \
    --time-str='' \
    --date-str='' \
    --verif-text='' \
    --wrong-text='' \
    --noinput-text='' \
    --lock-text='' \
    --lockfailed-text='' \
    --greeter-text='' \
    --no-modkey-text \
