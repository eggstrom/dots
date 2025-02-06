#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"/..
. helpers/init.sh

option disabled
option height 50%
option info inline:'= '
option info-command 'echo "$(evaluate {q}) [Calculator]"'

bind 'enter:execute-silent(accept {})'
bind 'ctrl-q:execute-silent(remove {n})'

evaluate() {
  set +u
  local EXPRESSION="$1" value
  ((value = EXPRESSION)) || value=0
  echo "$value"
}
export -f evaluate

accept() {
  local OPTION="$1"

  if [[ -z "$OPTION" ]]; then
    local value

    value="$(evaluate "$FZF_QUERY")"
    if [[ "$value" != 0 ]]; then
      options="$(
        echo "$value"
        sed "/^$value\$/d" "$FILE"
      )"
      echo "$options" >"$FILE"
      post "reload($RELOAD)+pos(1)+clear-query"
    fi
  else
    post "put($OPTION)+pos(1)"
  fi
}
export -f accept

remove() {
  local POS="$1"
  sed -i "$POS"d "$FILE"
  post "reload($RELOAD)"
}
export -f remove

FILE="$(mktemp -t fzf-calculator.XXXXXX)"
export FILE
export RELOAD="echo; cat '$FILE'"

echo | fzf || :

rm "$FILE"
