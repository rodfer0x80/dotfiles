#!/bin/sh
STATUS=$(systemctl --user status mpd | grep "Active" | cut -d ":" -f2 | cut -d " " -f2 | sed "s/\"//g" | sed "s/ //g" | sed "s/\n//g")
if [[ "$STATUS" == "active" ]]; then
    systemctl --user stop mpd
    sleep 1
    pkill ymuse
else
    systemctl --user start mpd
    sleep 3
    ymuse
fi
