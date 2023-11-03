#!/bin/sh

WORKDIR="~/.cache/archlinux_update"
TIMESTAMP="$(date +'%H-%M-%S_%d-%m-%Y')"
CACHEFILE="$WORKDIR/$TIMESTAMP.log"
test -e "$WORKDIR" && rm -rf "$WORKDIR"
mkdir -p "$WORKDIR" && touch "$CACHEFILE"
# refresh
reset
sync
# update pacmandb
yes | sudo pkgfile -u || exit 1
yes | sudo pacman -Fyy || exit 2 
yes | sudo pacman-db-upgrade || exit 3 
yes | sudo pacman -Scc || exit 4 
# update pacman keyring first
# only then update other packages
yes | sudo pacman -Syyu archlinux-keyring || exit 5 
# update AUR
yes | yay -Syua || exit 7 
# yes |  pacman -Rscn $(yay -Qtdq)
yes | yay -Yc || exit 8 
# reboot kernel
sudo mkinitcpio -p linux || exit 9
# refresh
reset 
sync
