#!/usr/bin/env bash

_update_prompt() {
  local exit_code=$? time
  if [[ -v _prompt_timer ]]; then
    time=$(((${EPOCHREALTIME/./} - _prompt_timer) / 1000000))
  else
    time=0
  fi
  unset _prompt_timer

  local K=$'\[\033[30m\]' # Black
  local R=$'\[\033[31m\]' # Red
  local G=$'\[\033[32m\]' # Green
  local Y=$'\[\033[33m\]' # Yellow
  local B=$'\[\033[34m\]' # Blue
  local M=$'\[\033[35m\]' # Magenta
  local C=$'\[\033[36m\]' # Cyan
  local W=$'\[\033[37m\]' # White
  local S=$'\[\033[m\]'   # Reset

  # Directory
  PS1="$S$C"
  if [[ ! -w "$PWD" ]]; then PS1+='󰌾 '; fi
  local path
  if path="$(git rev-parse --show-toplevel 2>/dev/null)"; then
    PS1+="${path##*/}"
  else
    PS1+='\w'
  fi

  # Git branch
  local branch
  if branch="$(git branch --show-current 2>/dev/null)"; then
    PS1+="$M  $branch"
  fi

  # Nix shell
  if [[ -v IN_NIX_SHELL ]]; then PS1+="$B  $IN_NIX_SHELL"; fi

  # Jobs
  local running_jobs stopped_jobs
  running_jobs="$(jobs -r | wc -l)"
  stopped_jobs="$(jobs -s | wc -l)"
  if [[ "$running_jobs" != 0 ]]; then PS1+="$W 󰊠 $running_jobs"; fi
  if [[ "$stopped_jobs" != 0 ]]; then PS1+="$K 󰧵 $stopped_jobs"; fi

  # Execution time
  if [[ "$time" -gt 0 ]]; then
    if [[ "$time" -ge 3600 ]]; then
      local hours=$((time / 3600))
      local mins=$((time / 60 % 60))
      local secs=$((time % 60))
      time="$(printf '%d:%02d:%02d' "$hours" "$mins" "$secs")"
    elif [[ "$time" -ge 60 ]]; then
      local mins=$((time / 60))
      local secs=$((time % 60))
      time="$(printf '%d:%02d' "$mins" "$secs")"
    fi
    PS1+="$Y 󰥔 $time"
  fi

  # Exit code
  if [[ $exit_code != 0 ]]; then PS1+="$R  $exit_code"; fi

  # Arrow
  if [[ $(id -u) = 0 ]]; then
    PS1+="\n$R❯ $S"
  else
    PS1+="\n$G❯ $S"
  fi
}

PS0='\[${PS0:$((_prompt_timer = ${EPOCHREALTIME/./})):0}\]'
PS2=$'\[\033[30m\]❯ \[\033[m\]' # Multiline
PS3='❯ '                        # Select
PS4='❯ '                        # Xtrace

if [[ "$PROMPT_COMMAND" != *_update_prompt* ]]; then
  PROMPT_COMMAND="_update_prompt; $PROMPT_COMMAND"
fi
