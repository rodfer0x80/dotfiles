#!/bin/sh

if [ "$1" == "" ];then
    exit 1
else
    IMG="$1"
fi

tesseract "$IMG" - -l eng
