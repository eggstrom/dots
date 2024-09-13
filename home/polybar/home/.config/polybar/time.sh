#!/usr/bin/env bash

format='%T'
toggle() {
    if [[ "$format" == '%T' ]]; then
        format='%a %b %d/%m/%Y %T'
    else
        format='%T'
    fi
}
trap 'toggle' USR1

while true; do
    date +"$format"
    sleep 1 &
    wait $!
done
