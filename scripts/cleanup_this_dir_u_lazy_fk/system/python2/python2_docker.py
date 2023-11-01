#!//usr/bin/python3


import sys
import os


def refresh():
    _path = __file__.split("/")
    path = ""
    for p in _path[:-1]:
        if len(p) > 1:
            path += "/" + p
    os.system("sudo docker image rm -f python2-docker 2>&1 >/dev/null")
    os.system(f"sudo docker build -t python2-docker {path}/. 2>&1 >/dev/null")
    return 0

def prompt():
    try:
        pyscript = sys.argv[1]
    except IndexError:
        pyscript = ""

    if pyscript:
        try:
            requirements = sys.argv[2]
        except IndexError:
            requirements = ""

        if requirements:
            os.system(f"sudo docker run --rm -v {os.environ['PWD']}/{requirements}:/opt/python2-docker/{requirements} -v {os.environ['PWD']}/{pyscript}:/opt/python2-docker/{pyscript} python2-docker pip2 install -r '{requirements}'")
        else:
            os.system(f"sudo docker run --rm -it -v {os.environ['PWD']}/{pyscript}:/opt/python2-docker/{pyscript} python2-docker python2 '{pyscript}'")
    else:
        os.system("sudo docker run -it python2-docker")
    return 0

def main():
    refresh()
    prompt()
    return 0


if __name__ == '__main__':
    sys.exit(main())
