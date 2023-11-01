#!/usr/bin/python3

import sys

def main():
    try:
        in_data = sys.stdin.read()
        
        if len(sys.argv) == 2 and sys.argv[1] == "-w":
            out_data = "".join([chr(int(bin_word, 2))\
                    for bin_word in in_data.split(" ")])
        
        else:
            out_data = "".join([chr(int(bin_word, 2))\
                    for bin_word in in_data.splitlines()])
        
        sys.stdout.write(out_data)
    
    except:
        return 1
    
    return 0


if __name__ == '__main__':
    sys.exit(main())
