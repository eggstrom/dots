list:
    @just -l

update-mirrorlist:
    @sudo reflector -phttps -l20 --sort rate --save /etc/pacman.d/mirrorlist
