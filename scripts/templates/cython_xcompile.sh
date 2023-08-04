#!/bin/sh

# dockcross [https://github.com/dockcross/dockcross]
# Transpile from Python to C using cyphon locally Then compile it using the docker image

if [ "$1" -eq "" ];then
    echo "Usage ./cython_xcompile.sh <filepath>"
fi
PROGNAME=main
PROGPATH=$1
cython -3 $PROGPATH+$PROGNAME+.py --embed
gcc $PROGPATH+$PROGNAME+.c -o $PROGNAME $(pkg-config --libs --cflags python3)
rm -f $PROGPATH+$PROGNAME+.c
echo "Compilation complete to ELF binary: $PROGNAME"
