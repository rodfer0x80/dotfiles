#!/bin/sh
STATUS=$(sudo systemctl status bluetooth | grep "Active" | cut -d ":" -f2 | cut -d " " -f2 | sed "s/\"//g" | sed "s/ //g" | sed "s/\n//g")
if [[ "$STATUS" == "active" ]]; then
    systemctl stop bluetooth &&\
        sleep 3 &&\
        pkill blueman-applet &&\
        pkill blueman-manager
else
    systemctl start bluetooth &&\
        sleep 3 &&\
        blueman-applet &
    sleep 1 &&\
        blueman-manager
fi
