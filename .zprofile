#!/bin/sh

# Launch xserver on startup after user login
if [ "$(tty)" = "/dev/tty1" ]; then
  if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
  fi
fi
