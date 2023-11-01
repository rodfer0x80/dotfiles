#!/bin/sh
docker run -v /:/mnt --rm -it alpine chroot /mnt sh 
