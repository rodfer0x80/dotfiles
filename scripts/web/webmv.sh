#!/bin/sh
IMPORT_DIR="/opt/Firefox/Import"
mkdir -p $IMPORT_DIR
yes | mv $1 "IMPORT_DIR"
