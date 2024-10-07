#!/bin/sh
if [ "$1" == "" ]; then
    exit 1
fi
FILE="$1"
ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";
