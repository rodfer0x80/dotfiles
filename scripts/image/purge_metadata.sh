#!/bin/sh
# Why: Purge all metadata from files
# Usage: execute script with arguments
# arg1 = file type -> all files from this type present
# in the current directory will have their metadata removed
# Output: metadata-purged version of files + orgininal files with
# filename sufix _original
if [ -z "$1" ]; then
    exit 1
fi
SUFIX="$1"
for i in *.$SUFIX; do echo "Processing $i"; exiftool -all= "$i"; done
