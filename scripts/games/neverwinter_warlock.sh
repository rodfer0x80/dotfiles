#!/bin/bash

# Function to press keys and mouse button
press_keys() {
    xdotool mousedown 1
    xdotool keydown a
    xdotool keydown d
    while xdotool getmouselocation --shell | grep -q 'BUTTON=1'; do
        xdotool keydown shift
        sleep 0.05
        xdotool keyup shift
        sleep 0.05
    done
    xdotool mouseup 1
    xdotool keyup a
    xdotool keyup d
}

# Main loop to monitor mouse button state
while true; do
    if xdotool getmouselocation --shell | grep -q 'BUTTON=1'; then
        press_keys
    fi
    sleep 0.1
done


