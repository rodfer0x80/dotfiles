#!/bin/sh

LIGHT_ICON="󰛨"

get_backlight()
{
    XLIGHT=$(xbacklight -get)
    echo "$LIGHT_ICON $(echo "$XLIGHT" | cut -d "." -f1)%" 
}

get_backlight
