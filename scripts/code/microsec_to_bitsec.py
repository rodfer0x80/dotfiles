#!/usr/bin/python3

import sys


def main():
    try:
        ysec = sys.stdin.readline()
        try:
            ysec = float(ysec)
        except ValueError:
            return 1
    
        res = 1 / (ysec * 0.000001)
        res = str(res).split(".")[0]
    
        sys.stdout.write(f"{res}")
    
    except:
        return 1
    
    return 0


if __name__ == '__main__':
    sys.exit(main())
