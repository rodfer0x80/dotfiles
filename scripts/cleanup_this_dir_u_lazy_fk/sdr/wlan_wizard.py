#!/bin/python3

import os
import sys


WLAN_SSID = ""


if __name__ == '__main__':
    cmdCheck = f"netctl is-active '{WLAN_SSID}' 1>&2>/dev/null"
    retCheck = os.system(cmdCheck)
    if retCheck == 768:
        sys.stdout.write("[*] Connect to wifi network\n")
        cmdConnect = f"sudo netctl start '{WLAN_SSID}'"
        retConnect = os.system(cmdConnect)
        if retConnect:
            #sys.stdout.write('1')
            exit(1)
    #sys.stdout.write('0')
    exit(0)
