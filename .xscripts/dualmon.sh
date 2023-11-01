#!/bin/sh

xrandr --output eDP1 --mode "1920x1080" --output HDMI1 --mode "1920x1080" --scale 2  --right-of eDP1 2>&1 >/dev/null || exit 1
exit 0
