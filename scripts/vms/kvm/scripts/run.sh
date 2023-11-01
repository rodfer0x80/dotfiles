#!/bin/sh

qemu-system-x86_64 -m 4196 -enable-kvm -cpu host -usb -device usb-tablet kali_img.cow
