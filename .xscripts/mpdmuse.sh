#!/bin/sh

status=$(systemctl --user is-active mpd.service)

if [ "$status" = "inactive" ]; then
    systemctl --user start mpd.service
    setsid -f ymuse
else
    systemctl --user stop mpd.service
    pkill ymuse
fi

