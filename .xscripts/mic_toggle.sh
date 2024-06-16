#!/bin/sh

SINK=$(pactl info | grep 'Default Source' | cut -d':' -f2)
pactl set-source-mute $SINK toggle
