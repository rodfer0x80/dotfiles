#!/bin/sh
for i in *.mp4; do
    ffmpeg -i "$i" -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 "`basename "$i" .mp4`.mp3"
done
for i in *.webm; do
    ffmpeg -i "$i" -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 "`basename "$i" .mp4`.mp3"
done
for i in *.mkv; do
    ffmpeg -i "$i" -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 "`basename "$i" .mp4`.mp3"
done
