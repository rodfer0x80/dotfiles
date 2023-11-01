#!/bin/sh

# sync
reset
sync
# update pacmandb
yes | pkgfile -u || exit 1
yes | pacman -Fyy || exit 2 
yes | pacman-db-upgrade || exit 3 
yes | pacman -Scc || exit 4 
# update pacman keyring
yes | pacman -Sy archlinux-keyring || exit 5 
# update pacman
yes | pacman -Syyu || exit 6
# update AUR
yes | yay -Syua || exit 7 
#yes |  pacman -Rscn $(yay -Qtdq)
yes | yay -Yc || exit 8 
# update python pip
yes | python -m pip install --upgrade pip || exit 9 
yes | py -m pip install --upgrade pip || exit 10
# reboot kernel
mkinitcpio -p linux
# oh-my-zsh
echo "omz update" || exit 11
# sync
reset
sync
