[private]
default:
  @just -l -u -f {{source_file()}}

alias pc := pacman-cache

pacman-cache:
  @paccache -ruk0 # Remove all uninstalled packages
  @paccache -rk1  # Keep 1 version of other packages
