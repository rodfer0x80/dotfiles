#!/bin/bash

OS=$1
ARCH=$2
FILENAME=$3

if [ -e $FILENAME ]; then
	if [[ -z $OS || -z $ARCH ]]; then
		echo "Usage: ./crosscompile.sh <os> <arch> <filename>"
	else
		export GOOS=$OS && export GOARCH=$ARCH && go build $FILENAME
	fi
else
	echo "Error: File not found>"
fi