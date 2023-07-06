#!/usr/bin/python3


import sys
import os
import requests


PROTO = "http"
HOST = "127.0.0.1"
PORT = "1337"
PATH = "/"
PARAM = "txt"
METHOD = "get"

def main():
    if METHOD == "get":
        while True:
            uri = f"{PROTO}://{HOST}:{PORT}{PATH}?{PARAM}="
            payload = input("$ ")
            uri = f"{uri}{payload}"
            res = requests.get(uri)

            print(res.content.decode('utf-8'))
    elif METHOD == "post":
        while True:
            uri = f"{PROTO}://{HOST}:{PORT}{PATH}?{PARAM}="
            payload = input("$ ")
            uri = f"{uri}{payload}"
            res = requests.post(uri)
            
            print(res.content.decode('utf-8'))
    exit(0)


if __name__ == '__main__':
    main()
    exit(0)
