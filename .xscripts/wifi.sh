#!/bin/sh

# Gets the wifi status

WIFI_FULL_ICON=''
WIFI_MID_ICON='󱚵'
NO_WIFI_ICON='󰖪'

get_wifi()
{
        if grep -q wl* "/proc/net/wireless"; then
                # Wifi quality percentage
                percentage=$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70)}'| xargs)
                case $percentage in
                        0)                              echo "$NO_WIFI_ICON";;
                        100|9[0-9]|8[0-9]|7[0-9])       echo "$WIFI_FULL_ICON" ;;
                        6[0-9]|5[0-9]|4[0-9]|3[0-9])    echo "$WIFI_MID_ICON" ;;
                        2[0-9]|1[0-9]|[0-9])            echo "$WIFI_MID_ICON" ;;
                        *)                              echo "$NO_WIFI_ICON"
                esac
        fi
}

get_wifi
