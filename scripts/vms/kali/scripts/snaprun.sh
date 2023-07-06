#!/bin/sh

qemu-system-x86_64 -m 4196 --snapshot -enable-kvm -cpu -usb -device usb-tablet host kali_img.cow
