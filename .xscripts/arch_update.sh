#!/bin/sh

# sync
reset
sudo sync
# update pacmandb
yes | sudo pkgfile -u || exit 1
yes | sudo pacman -Fyy || exit 2 
yes | sudo pacman-db-upgrade || exit 3 
yes | sudo pacman -Scc || exit 4 
# update pacman keyring
yes | sudo pacman -Sy archlinux-keyring || exit 5 
# update pacman
yes | sudo pacman -Syyu || exit 6
# update AUR
yes | yay -Syua || exit 7 
#yes | sudo pacman -Rscn $(yay -Qtdq)
yes | yay -Yc || exit 8 
# update python pip
yes | pip install --upgrade pip || exit 9 
# oh-my-zsh
echo "omz update" || exit 10 
# sync
reset
sudo sync
