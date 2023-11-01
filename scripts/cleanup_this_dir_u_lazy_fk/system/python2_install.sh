#!/bin/sh

gpg --keyserver keyserver.ubuntu.com --recv-key 04C367C218ADD4FF#
mkdir -p  ~/chroot/python2
CHROOT=~/chroot/python2
mkarchroot $CHROOT/root base-devel
cd ~/chroot/python2/root/home/
sudo git clone https://aur.archlinux.org/python2.git
sudo chown $USER:$USER ~/chroot/python2/root/home/python2/
cd ~/chroot/python2/root/home/python2/
makechrootpkg -c -r $CHROOT
