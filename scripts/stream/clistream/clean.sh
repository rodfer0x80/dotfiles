#!/bin/sh
VOD_LOCAL="./media/vod.mkv"
SOUND_LOCAL="./media/sound.mp3"
IMG_LOCAL="./media/thumbnail.jpg"

VOD_ARHLOCAL="./archive/vod.mkv"
SOUND_ACHLOCAL="./archive/sound.mp3"
IMG_ARHLOCAL="./archive/thumbnail.jpg"

mkdir -p "./archive"

d=$(date '+%Y-%m-%d_%H:%M:%S')

mv "$VOD_LOCAL" "$d$VOD_ARHLOCAL"
mv "$SOUND_LOCAL" "$d$SOUND_ARHLOCAL"
mv "$IMG_LOCAL" "$d$IMG_ARHLOCAL"
