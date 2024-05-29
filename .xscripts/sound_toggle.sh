#!/bin/sh

SINK=$(pactl info | grep 'Default Sink' | cut -d':' -f2)
pactl set-sink-mute $SINK toggle
