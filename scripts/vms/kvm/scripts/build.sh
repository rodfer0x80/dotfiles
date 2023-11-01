#!/bin/sh

qemu-img create -f qcow2 kali_img 40G
qemu-img create -o backing_file=kali_img_backup.raw,backing_fmt=raw -f qcow2 kali_img.cow
