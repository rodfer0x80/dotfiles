#!/bin/sh
INPUT="$1"
if [ "$INPUT" == "" ];then
    exit 1
fi
OUTPUT=$(echo "$INPUT" | sed -e s/wav/mp3/g)
ffmpeg -i "$INPUT" -vn -ar 44100 -ac 2 -b:a 192k "$OUTPUT"
