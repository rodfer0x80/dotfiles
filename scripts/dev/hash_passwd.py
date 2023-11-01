#!/usr/bin/python3


import bcrypt
import sys


def hash_passwd(passwd: str) -> str:
    salt = bcrypt.gensalt(rounds=10)
    return bcrypt.hashpw(passwd.encode(),salt).decode()


def main():
    try:
        passwd = sys.stdin.read()
    
        hashed_passwd = hash_passwd(passwd)
        
        sys.stdout.write(hashed_passwd)
    
    except:
        return 1
    
    return 0


if __name__ == '__main__':
    sys.exit(main())
