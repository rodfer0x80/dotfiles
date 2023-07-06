#!/bin/sh
if [ -z "$1" ];then
    exit 1
fi
FILE="$1"
shred -n 31337 -z -u "$FILE"
exit
