#!/bin/sh

VOL="+2%"
SINK=$(pactl info | grep 'Default Sink' | cut -d':' -f2)
pactl set-sink-volume $SINK $VOL
