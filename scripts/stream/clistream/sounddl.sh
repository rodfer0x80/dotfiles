#!/bin/sh
if [ "$1" == "" ]; then
    exit 1
fi
FILE="./media/sound.mp3"

mkdir -p "./media"

yt-dlp --no-playlist --audio-format "mp3" "$1" -o "$FILE"

ffmpeg -i "${FILE}.webm" -vn -ab 128k -ar 44100 -y "$FILE"
rm "$FILE.webm"
