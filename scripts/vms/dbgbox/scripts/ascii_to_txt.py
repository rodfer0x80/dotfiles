#!/usr/bin/python3

import sys

if __name__ == '__main__':
    in_data = sys.stdin.read()
    if len(sys.argv) == 2 and sys.argv[1] == "-w":
        out_data = "".join([chr(int(char)) for char in in_data.split(" ")])
    else:
        out_data = "".join([chr(int(char)) for char in in_data.splitlines()])
    sys.stdout.write(out_data)
    exit(0)
