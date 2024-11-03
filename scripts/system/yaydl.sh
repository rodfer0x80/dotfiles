#!/bin/sh
sudo pacman -Syu
sudo pacman -S base-devel git
mkdir -p ~/desktop
cd ~/desktop
git clone https://aur.archlinux.org/yay.git ~/desktop/yay
makepkg -si
yay --version
