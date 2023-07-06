#!/bin/sh

LIGHT_ICON="ﯦ"

get_backlight()
{
    XLIGHT=$(xbacklight)
    echo "$LIGHT_ICON $(echo "$XLIGHT" | cut -d "." -f1)%" 
}

get_backlight
