#!/bin/sh

# refresh
reset
sudo sync
sudo systemctl daemon-reload
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
# update pacman
yes | sudo pacman -Syu || exit 6 
# rebuild bootloader
sudo grub-mkconfig -o /boot/grub/grub.cfg || exit 11
# reboot kernel
sudo mkinitcpio -P || exit 12
# refresh
sudo systemctl daemon-reload
sudo sync
reset 
