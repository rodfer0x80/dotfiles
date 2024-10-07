#!/bin/sh
if [ "$1" == "" ]; then
    exit 1
fi
FILE="$1"
#!/bin/sh
if [ "$1" == "" ]; then
    exit 1
fi
FILE="$1"
ffmpeg -i "${FILE}" -vf "scale=1920x1080" -c:v libx264 -preset medium -crf 23 -c:a aac -b:a 128k -movflags +faststart -y "${FILE%.webm}.mov";

