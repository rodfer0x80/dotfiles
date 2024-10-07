#!/bin/bash

CONFIGS_LOCAL="./.configs"
STREAM_LINK=""

SOUND_LOCAL="./media/sound.mp3"
IMG_LOCAL="./media/thumbnail.jpg"
VOD_LOCAL="./media/vod.mkv"

mkdir -p "./media"

while IFS= read -r line
do
    if [ "$STREAM_LINK" == "" ]; then
        STREAM_LINK="$(echo $line | cut -d ' ' -f2)"
    else
        STREAM_LINK="$STREAM_LINK/$(echo $line | cut -d ' ' -f2)"
    fi
done < "$CONFIGS_LOCAL"

ffmpeg -loop 1 -framerate 2 -i "$IMG_LOCAL" -i "$SOUND_LOCAL" -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a copy -shortest -pix_fmt yuv420p "$VOD_LOCAL"

ffmpeg -re -stream_loop -1 -i "$VOD_LOCAL" -c copy -f flv "${STREAM_LINK}"

