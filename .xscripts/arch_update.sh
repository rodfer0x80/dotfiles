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
yes | yay -Syua || exit 7 
# yes |  pacman -Rscn $(yay -Qtdq)
yes | yay -Yc || exit 8 
# reboot kernel
sudo dkms autoinstall || exit 9
sudo grub-mkconfig -o /boot/grub/grub.cfg || exit 10
sudo mkinitcpio -P || exit 11
# refresh
reset 
sync
