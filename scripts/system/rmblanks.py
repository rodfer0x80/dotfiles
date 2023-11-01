#!/usr/bin/python3

import sys

if __name__ == '__main__':
    in_data = sys.stdin.read()
    out_data = "".join(f"{word}" for word in in_data.split(" "))
    sys.stdout.write(out_data)
    exit(0)
