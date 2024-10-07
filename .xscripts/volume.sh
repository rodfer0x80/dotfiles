#!/bin/sh

# Prints out the volume percentage

VOLUME_ON_ICON=''
VOLUME_MUTED_ICON=''

get_volume(){
    volume_left=$(amixer get Master | grep "Left:" | cut -d '[' -f2 | cut -d ']' -f1 | cut -d '%' -f1)
    volume_right=$(amixer get Master | grep "Right:" | cut -d '[' -f2 | cut -d ']' -f1 | cut -d '%' -f1)
    if [[ -z "$volume_right" ]]; then
        volume=$(amixer get Master | grep "Mono" | cut -d '[' -f2 | cut -d ']' -f1 | cut -d ":" -f1 | cut -d '%' -f1 | cut -d " " -f1 | tr -d '\n')
        vstatus=$(amixer get Master | grep "Mono" | cut -d '[' -f4 | cut -d ']' -f1 | cut -d' ' -f6 | tr -d '\n')
        if [[ "${vstatus}" == 'off' ]]; then
            echo "$VOLUME_MUTED_ICON $volume%"
            exit 0
        else
            echo "$VOLUME_ON_ICON $volume%"
            exit 0
        fi
    fi
    volume=$(($((volume_left+volume_right))/2))
    status_left=$(amixer get Master | grep "Left:" | cut -d '[' -f3 | cut -d ']' -f1)
    status_right=$(amixer get Master | grep "Right:" | cut -d '[' -f3 | cut -d ']' -f1)
    if [[ "${status_left}" == 'off' && ${status_right} == 'off' ]]
    then
        echo "$VOLUME_MUTED_ICON $volume%"
        exit 0
    else
        echo "$VOLUME_ON_ICON $volume%"
        exit 0
    fi
}

get_volume
