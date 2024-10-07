#!/bin/sh
# DWM bar
while xsetroot -name " [ $(~/.xscripts/volume.sh) ] [ $(~/.xscripts/backlight.sh) ] [ $(~/.xscripts/battery.sh)] [ $(~/.xscripts/wifi.sh) $(~/.xscripts/tor.sh) ] [ $(~/.xscripts/date.sh) ] [ $(~/.xscripts/time.sh) ] "
do
    sleep 1
done &

