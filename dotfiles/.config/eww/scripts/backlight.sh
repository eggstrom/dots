#!/usr/bin/env bash

# Prints "true" and updates brightness if backlight is found, otherwise prints "false"
if brightnessctl -c backlight; then
    eww update brightness="$(("$(brightnessctl get)" * 100 / "$(brightnessctl max)"))"
    echo true
else
    echo false
fi
