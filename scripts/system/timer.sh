#!/bin/sh

# sound-theme-freedesktop
# figlet
if ! command -v figlet &> /dev/null
then
    echo "figlet could not be found"
    exit
fi

seconds="$1"
start="$(($(date +%s) + $seconds))"
trap "echo 'Timer stopped.'; exit" INT

font="big"

while [ "$start" -ge "$(date +%s)" ]; do
    time="$(( $start - $(date +%s) ))"
    clear
    time_str="$(date -u -d "@$time" +%H:%M:%S)"
    figlet_output=$(figlet -f $font "$time_str")
    term_width=$(tput cols)
    term_height=$(tput lines)
    figlet_height=$(echo "$figlet_output" | wc -l)
    figlet_width=$(echo "$figlet_output" | awk '{print length}' | sort -n | tail -1)
    start_row=$(( (term_height - figlet_height) / 2 ))
    start_col=$(( (term_width - figlet_width) / 2 ))
    for _ in $(seq 1 $start_row); do echo ""; done
    echo "$figlet_output" | while IFS= read -r line; do
        printf "%*s\n" $((start_col + ${#line})) "$line"
    done
    sleep 1
done

paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
echo "Time's up!"

