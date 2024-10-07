#!/bin/sh
if [[ -z "$1" ]]; then
    CWD="$HOME/screenshots"
else
    CWD="$1"
fi
mkdir -p "$CWD"
TIMESTAMP="$(date +%H:%M:%S_%d-%m-%Y).png"
import -window root "/$CWD/$TIMESTAMP"
