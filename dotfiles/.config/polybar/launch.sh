#!/usr/bin/env bash

pgrep polybar | xargs kill
polybar -r bar & disown
