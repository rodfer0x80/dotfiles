#!/usr/bin/python3


import os
import sys
import random
import subprocess


def main():
    # Try to read cached n value or make it 0
    configs_local = f"{os.environ['HOME']}/.nxbg"
    print(configs_local)
    try:
        h = open(configs_local, 'r')
        n = int(h.read())
        h.close()
    except (ValueError, IOError, OSError):
        n = 0
    
    # List backgrounds and feh set-bg number n from listdir
    os.umask(~0o700) # linux mask 700
    home = os.environ['HOME']
    dirpath = f"{home}/.xbgs/"
    bgs = os.listdir(dirpath)
    
    try:
        bg = bgs[n]
    except IndexError:
        n = 0
        bg = bgs[n]
        
    subprocess.Popen(f"feh --bg-fill {dirpath}/{bg}".split(" "))
    
    # Increment n so next time we get diff background
    n = n + 1
    try:
        h = open(configs_local, 'w')
        n = h.write(str(n))
        h.close()
    except (ValueError, IOError, OSError):   
        return 3

    return 0


if __name__ == '__main__':
    sys.exit(main())

