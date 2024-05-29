#!/bin/sh

# refresh
reset
sync
# update repo file metadata
yes | sudo pkgfile -u || exit 1
# force refresh database
yes | sudo pacman -Fyy || exit 2 
# upgrade database
yes | sudo pacman-db-upgrade || exit 3
# clear pacman cache
yes | sudo pacman -Scc || exit 4 
# clear orphan packages
yes | sudo pacman -Rns $(pacman -Qdtq) || exit 5
# update pacman keyring first only then update other packages
yes | sudo pacman -Sy archlinux-keyring || exit 6 
yes | sudo pacman -Syu || exit 7 
# update AUR
yes | yay -Syua || exit 8 
# remove uneeded dependencies
yes | yay -Yc || exit 9 
# clear cache
yes | yay -Sc || exit 10 
# reboot kernel
#sudo dkms autoinstall || exit 9
sudo grub-mkconfig -o /boot/grub/grub.cfg || exit 11
sudo mkinitcpio -P || exit 12
# refresh
sync
reset 
