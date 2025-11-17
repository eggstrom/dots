[private]
default:
  @just -l -u -f {{source_file()}}

alias ls := list
alias ils := install-list
alias uls := uninstall-list
alias d := diff
alias i := install
alias u := uninstall
alias s := sync
alias um := update-mirrors

list dir:
  @sort $(fd -LHIt=f . ../packages/{{dir}})

install-list dir:
  @comm -13 <(pacman -Qeq) <(just p ls {{dir}})

uninstall-list dir:
  @comm -23 <(pacman -Qeq) <(just p ls {{dir}})

diff dir:
  -@diff --color=always <(pacman -Qeq) <(just p ls {{dir}})

install dir:
  #!/usr/bin/env bash
  if [ "$(just p ils {{dir}} | wc -l)" != 0 ]; then
    just p ils {{dir}} | yay -S -
  fi

uninstall dir:
  #!/usr/bin/env bash
  if [ "$(just p uls {{dir}} | wc -l)" != 0 ]; then
    just p uls {{dir}} | sudo pacman -Rsn -
  fi

sync dir: (install dir) (uninstall dir)

update-mirrors:
  @sudo reflector -phttps -l20 --sort rate --save /etc/pacman.d/mirrorlist
