#!/bin/sh

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
yes | sudo yay -Syua || exit 7 
# yes |  pacman -Rscn $(yay -Qtdq)
yes | sudo yay -Yc || exit 8 
# update system python3 pip
yes | sudo python3 -m pip install --upgrade pip || exit 9 
# update user python3-venv pip
yes | py -m pip install --upgrade pip || exit 10
# reboot kernel
mkinitcpio -p linux
# manually update oh-my-zsh
echo "omz update" || exit 11
# refresh
reset 
sync
