#!/usr/bin/env bash

case "$1" in
    'discord') "$1" --disable-smooth-scrolling ;;
    *) "$1" ;;
esac
