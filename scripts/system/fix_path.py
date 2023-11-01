#!/usr/bin/python3


import os
import sys

def get_path_env_var():
    return os.environ['PATH']


## Remove path duplicates and sorts for root owned dirs first and then alpha 
def path_rm_dups() -> str:
    # get path from env var
    path_str = get_path_env_var()
    
    # remove duplicates using a set
    path_set = set()
    [path_set.add(path) for path in path_str.split(':')]

    # sort set and transform into list
    path_ls = list()
    [path_ls.append(path) for path in path_set]
    
    # remove unknown paths
    for path in path_ls:
        try:
            os.listdir(path)
        except:
            path_ls.remove(path)
    
    # 
    root_path = list()
    user_path = list()
    for path in path_ls:
        if os.stat(path).st_uid:
            user_path.append(path)
        else:
            root_path.append(path)
    root_path = sorted(root_path, key=len)
    user_path = sorted(user_path, key=len)
    
    path_ls = list()
    [path_ls.append(path) for path in root_path]
    [path_ls.append(path) for path in user_path]
     
    # flatten list into a string
    path_str = ""
    for path in path_ls:
        if not path_str:
            path_str = f"{path}"
        path_str = f"{path_str}:{path}"

    return path_str


def main():
    sys.stdout.write(path_rm_dups())
    return 0


if __name__ == '__main__':
    sys.exit(main())
