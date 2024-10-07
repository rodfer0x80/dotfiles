#!/bin/sh

yt-dlp --yes-playlist --extract-audio --audio-format "mp3" "$1"
