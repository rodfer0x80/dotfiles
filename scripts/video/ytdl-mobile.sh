#!/bin/sh


yt-dlp -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' --merge-output-format mp4 $1
