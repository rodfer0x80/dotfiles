#!/bin/sh
sudo rm -rf /dev/mtdblock0
sudo mknod /dev/mtdblock0 b 31 0
