#!/bin/sh

DESKTOP="/home/rodfer/Desktop"
DOCUMENTS="/home/rodfer/Documents"
DOWNLOADS="/home/rodfer/Downloads"

test -e "$DESKTOP" && rmdir "$DESKTOP"
test -e "$DOCUMENTS" && rmdir "$DOCUMENTS"
test -e "$DOWNLOADS" && rmdir "$DOWNLOADS"

