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
yes | sudo pacman -Rns $(pacman -Qdtq)
# update pacman keyring first only then update other packages
yes | sudo pacman -Sy archlinux-keyring || exit 5 
yes | sudo pacman -Syu || exit 6 
# update AUR
yes | yay -Syua || exit 7 
# remove uneeded dependencies
yes | yay -Yc || exit 8 
# clear cache
yes | yay -Sc || exit 9 
# reboot kernel
#sudo dkms autoinstall || exit 9
sudo grub-mkconfig -o /boot/grub/grub.cfg || exit 10
sudo mkinitcpio -P || exit 11
# refresh
sync
reset 
