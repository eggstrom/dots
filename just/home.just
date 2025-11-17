[private]
default:
  @just -l -u -f {{source_file()}}

alias ls := list
alias l := link
alias u := unlink
alias r := relink

dir := justfile_directory() + "/home"

list:
  @ls {{dir}}

link +dirs:
  @stow --no-folding -d {{dir}} -t ~ {{dirs}}

unlink +dirs:
  @stow --no-folding -d {{dir}} -t ~ -D {{dirs}}

relink +dirs:
  @stow --no-folding -d {{dir}} -t ~ -R {{dirs}}
