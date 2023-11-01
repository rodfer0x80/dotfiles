#!/usr/bin/python3

import sys


def main():
    try:
        in_data = sys.stdin.read()
        
        if len(sys.argv) == 2 and sys.argv[1] == "-w":
            out_data = "".join(f"{bytes.fromhex(x_word).decode('utf-8')}\n"\
                    for x_word in in_data.split(" "))
        
        else:
            out_data = "".join(f"{bytes.fromhex(x_word).decode('utf-8')}\n"\
                    for x_word in in_data.splitlines())
        
        sys.stdout.write(out_data[:-1])
    except:
        return 1
    
    return 0


if __name__ == '__main__':
    sys.exit(0)
