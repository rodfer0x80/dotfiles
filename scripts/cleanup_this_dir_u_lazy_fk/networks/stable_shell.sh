#!/bin/sh
echo "python3 -c 'import pty;pty.spawn(\"/bin/bash\")'"
echo "CTRL^Z"
echo "stty raw -echo;fg"
echo "export SHELL=bash" # or SHELL=sh
echo "export TERM=xterm" # or TERM=xterm256-color
ROWS=$(stty -a | grep "rows" | cut -d";" -f2 | cut -d" " -f3)
COLUMNS=$(stty -a | grep "columns" | cut -d";" -f3 | cut -d" " -f3)
echo "stty rows $ROWS columns $COLUMNS;reset"
