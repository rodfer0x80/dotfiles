#!/bin/sh

yt-dlp --no-playlist --extract-audio --audio-format mp3 "$1"

