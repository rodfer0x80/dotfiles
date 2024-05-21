#!/bin/sh
if [ "$1" == "" ]; then
    exit 1
fi
FILE="$1"
ffmpeg -i "${FILE}" -c:v copy -c:a copy -y "${FILE%.webm}.mkv";
