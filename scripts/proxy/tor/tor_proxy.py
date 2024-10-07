from stem import Signal
from stem.control import Controller
import requests
import time
import os

# tor --hash-password $TOR_PASSWD
# /etc/tor/torr: 
#   cookieAuth: 1
#   hashesPasswd: (hassed_tor_pass)
#   controlPort 9051
# start tor service (socks proxy at port 9050 http and https)


def get_tor_session(port=9050):
    session = requests.session()
    # Tor uses the 9050 port as the default socks port
    session.proxies = {'http':  f'socks5://127.0.0.1:{port}',
                       'https': f'socks5://127.0.0.1:{port}'}
    return session

def reset_tor_session(controller_port=9051):
    tor_passwd = os.environ['TOR_PASSWD']
    with Controller.from_port(port = controller_port) as controller:
        controller.authenticate(f"{tor_passwd}")
        controller.signal(Signal.NEWNYM) # reset IP
    time.sleep(5)
    return 0


if __name__ == '__main__':
    
    for i in range(30):
        s = get_tor_session()
        getAddress = "https://www.google.com"
        res = s.get(f"{getAddress}")
        print(f"{i}: {res.status_code}")
        reset_tor_session()
