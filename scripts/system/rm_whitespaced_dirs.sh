#!/bin/bash

DIR="$1"
if [ -z "$DIR" ];then
    DIR="."
fi
EXT="$2"
if [ -z "$EXT" ]; then
    EXT="py"
fi

find "$DIR" -type f -name "*.$EXT" -exec sed -i -E 's/[[:space:]]*$//' {} \;
