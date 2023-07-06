#!/bin/sh

# Launch xserver on startup after user login
if [ "$(tty)" = "/dev/tty1" ]; then
    startx
fi
