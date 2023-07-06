#!/usr/bin/python3


import os
import sys
import random
import subprocess


def main():
    home = os.environ['HOME']
    dirpath = f"{home}/.xbgs/"

    bgs = os.listdir(dirpath)
    bg = random.choice(bgs)
    
    subprocess.Popen(f"feh --bg-fill {dirpath}/{bg}".split(" "))

    return 0


if __name__ == '__main__':
    sys.exit(main())

