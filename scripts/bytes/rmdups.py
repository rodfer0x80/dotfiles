#!/usr/bin/env python3

import sys
import os
import time
import subprocess
import hashlib


def md5(filepath):
    hash_md5 = hashlib.md5()
    with open(filepath, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()

def heuristicSearch(path, cache="/tmp"):
    if cache == "/tmp":
        cache = f"{cache}/rmdups.cache"
        cached_data = ""
        h = open(cache, 'w')
        h.write(cached_data)
        h.close()

    if os.path.isdir(path):
        ls = os.listdir(path)
        for ls_path in ls:
            heuristicSearch(f"{path}/{ls_path}", cache=cache)
    else:
        checksum = md5(path)
        w_flag = True
        with open(cache, 'r') as h:
            if h.readline() == checksum:
                print(p)
                # os.remove(path
                w_flag = False
        if w_flag:
            h = open(cache, 'a')
            h.write(f"{checksum}\n")
            h.close()
            w_flag = False

def main():
    WORKDIR = ""
    if len(sys.argv) != 2 :
        sys.stderr.write("Usage: rmdups <WORKDIR>\n")
        return 1
    else:
        if sys.argv[1][0] != "/":
            WORKDIR = f"{os.environ['PWD']}/{sys.argv[1]}"
        else:
            WORKDIR = sys.argv[1]
    heuristicSearch(WORKDIR)
    return 0


if __name__ == '__main__':
    sys.exit(main())
