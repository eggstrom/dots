#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"/..
. helpers/init.sh

export FZF_TITLE='Music Player'
export FZF_NTH_MAX=2
option header-lines 1
option preview preview

bind 'start:execute-silent(listen &)'
bind "load:pos($(mpc current -f %position%))"

bind 'enter:execute-silent(mpc play {1})'
bind 'ctrl-r:reload(print_playlist)'
bind 'alt-t:execute-silent(mpc toggle)'
bind 'alt-e:execute-silent(mpc repeat)'
bind 'alt-a:execute-silent(mpc random)'
bind 'alt-s:execute-silent(mpc single)'
bind 'alt-c:execute-silent(mpc consume)'
bind 'alt-+:execute-silent(mpc volume +1)'
bind 'alt--:execute-silent(mpc volume -1)'
bind 'alt-r:execute-silent(mpc clear; mpc update; mpc ls | mpc add)'

print_playlist() {
  mpc listall | nl -w1 -s"$D" | print_columns Position,File 1
}
export -f print_playlist

preview() {
  file="$(mpc current -f '%file%')"
  songpos="$(mpc status %songpos%)"
  length="$(mpc status %length%)"
  currenttime="$(mpc status %currenttime%)"
  totaltime="$(mpc status %totaltime%)"
  volume="$(mpc status %volume%)"
  state="$(mpc status %state%)"
  repeat="$(mpc status %repeat%)"
  random="$(mpc status %random%)"
  single="$(mpc status %single%)"
  consume="$(mpc status %consume%)"

  cat <<-EOF
	${C}File:     $S${file:-N/A}
	${C}Position: $S$songpos/$length
	${C}Time:     $S$currenttime/$totaltime

	${C}Volume:   $S${volume//[ %]/}%
	${C}State:    $S${state^}
	${C}Repeat:   $S${repeat^}
	${C}Random:   $S${random^}
	${C}Single:   $S${single^}
	${C}Consume:  $S${consume^}
	EOF
}
export -f preview

# Updates preview every second or once there's an event
listen() {
  while post refresh-preview; do
    sleep 1 & sleep_pid=$!
    mpc idle & mpc_pid=$!
    wait -np pid $sleep_pid $mpc_pid

    case $pid in
      "$sleep_pid") kill $mpc_pid ;;
      "$mpc_pid") kill $sleep_pid ;;
    esac
  done
}
export -f listen

print_playlist | fzf
