list:
    @just -l

update-mirrorlist:
    @sudo reflector -phttps -l20 --sort rate --save /etc/pacman.d/mirrorlist

clean-cache:
    @paccache -ruk0 # Remove all uninstalled packages
    @paccache -rk1  # Keep 1 version of other packages
