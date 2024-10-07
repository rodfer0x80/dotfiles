#!/bin/sh
ffmpeg -i $1 -vf "transpose=1" $1.rotated
rm -f $1
mv $1.rotated $1

