#!/bin/sh

wget --mirror --convert-links adjust-extension --page-requisites --no-parent --wait=0.1 --random-wait $1
