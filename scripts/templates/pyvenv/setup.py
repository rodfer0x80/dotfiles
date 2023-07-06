#!/usr/bin/env python3


import sys
import os


def main():
    t_dir = "/".join(__file__.split("/")[:-1])
    if t_dir[-1] == ".":
        t_dir = t_dir[:-2]
    cwd = os.environ['PWD']
    os.system(f"cp -r {t_dir}/package/* {cwd}")
    return 0


if __name__ == '__main__':
    sys.exit(main())
