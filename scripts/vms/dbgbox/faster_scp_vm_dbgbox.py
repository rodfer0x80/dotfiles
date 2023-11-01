#!/usr/bin/python3

import os
import sys
import time
import random

# Settings
USER = "dbgbox"
HOST = "127.0.0.1"
PORT = 6622
VM_NAME = "dbgbox"
KEY_LOCAL = "~/.ssh/id_rsa"

# Error codes
SSH_CON_REFUSED = 65280
VM_NOT_PAUSED = 256
# Configs
#PWD = "/".join([n for n in __file__.split('/')[:-1]])+"/"
#with open(f"{PWD}/{__file[:-3]}.cfg", 'rw') as fp:
#    cfg_in = fp.read().splitlines()
#VM_LIVE = cfg_in[1].split("=")[2][1:]


# --------------------------
# Utils
# --------------------------

def genRandomAsciiStr(n: int):
    chars = list(map(chr, range(97, 123)))
    digits = list(map(chr, range(48, 58)))
    s = chars + digits
    s_size = len(s)-1
    return "".join(s[random.randint(0, s_size)] for _ in range(n))

# --------------------------
# VBoxManage Controls
# --------------------------

def startVM():
    return os.system(f"VBoxManage startvm '{VM_NAME}' --type headless")

def sshVM():
    return os.system(f"ssh -p {PORT} -i {KEY_LOCAL} {USER}@{HOST}")

def resumeVM(sysout=""):
    red = ""
    if sysout == "stderr":
        red = "2>/dev/null"
    return os.system(f"VBoxManage controlvm '{VM_NAME}' resume --type headless {red}")

def pauseVM(sysout=""):
    red = ""
    if sysout == "stderr":
        red = "2>/dev/null"
    return os.system(f"VBoxManage controlvm '{VM_NAME}' pause --type headless {red}")
           
def poweroffVM():
    return os.system(f"VBoxManage controlvm '{VM_NAME}' poweroff --type headless")

def takeSnapshotVM(snapshotName="", snapshotDescription=""):#: str, caseLive: str):
    if not snapshotName:
        snapshotName = genRandomAsciiStr(32)
    return os.system(f"VBoxManage snapshot '{VM_NAME}' take {snapshotName} --description='{snapshotDescription}'")# {caseLive}")

def scpToGuestVM(filepath: str):
    filename = "".join(filepath.split("/")[-1])
    cmd = f'dd if={filename} | gzip -1 - | pv | ssh -p {PORT} -i {KEY_LOCAL} {USER}@{HOST} "gunzip -1 - | dd of=/home/dbgbox/{filename}"'
    try:
        return os.system(cmd)
    except:
        return SSH_CON_REFUSED
    # return os.system(f"scp -r -P {PORT} -i {KEY_LOCAL} {filepath} {USER}@{HOST}:/home/dbgbox/{filename}")

def scpToHostVM(filepath: str):
    filename = "".join(filepath.split("/")[-1])
    return os.system(f"scp -r -P {PORT} -i {KEY_LOCAL} {USER}@{HOST}:{filepath} /tmp/{filename}")


# --------------------------
# User I/O (menu)
# --------------------------

def displayMenu():
    print("="*16)
    print(f"[BOX]::{VM_NAME}")
    print(f"[NETWORK]::{USER}@{HOST}:{PORT}")
    print("="*16)
    print("8. snapshot")
    print("7. poweroff")
    print("6. pause")
    print("5. resume")
    print("4. start")
    print("3. scp to host")
    print("2. scp to guest")
    print("1. ssh")
    print("0. quit")
    print("="*16)
    return 0


def getChoiceMenu():
    str_choice = input(">>> ")
    try:
        int_choice = int(str_choice[0])
    except ValueError:
        return -1
    return int_choice

def scpToHostVMMenu():
    filepath = input("Full path to file: ")
    res_err = resumeVM("stderr")
    time.sleep(2)
    con_err = scpToHostVM(filepath)
    if con_err == SSH_CON_REFUSED:
        startVM()
        time.sleep(3)
        con_err = scpToHostVM(filepath)
        while con_err == SSH_CON_REFUSED:
            time.sleep(2)
            con_err = scpToHostVM(filepath)
    time.sleep(2)
    if res_err != VM_NOT_PAUSED:
        pauseVM()
    return 0

def scpToGuestVMMenu():
    filepath = input("Full path to file: ")
    res_err = resumeVM("stderr")
    time.sleep(2)
    con_err = scpToGuestVM(filepath)
    if con_err == SSH_CON_REFUSED:
        startVM()
        time.sleep(1)
        while con_err == SSH_CON_REFUSED:
            time.sleep(2)
            con_err = scpToGuestVM(filepath)
        poweroffVM()
    if res_err != VM_NOT_PAUSED:
        pauseVM()
    return 0

def takeSnapshotVMMenu():
    #if VM_LIVE:
    #    caseLive = "--live"
    #    #else:
    #    caseLive = ""
    snapshotName = input("Snapshot Name: ")
    snapshotDescription = input("Snapshot Description: ")
    takeSnapshotVM(snapshotName, snapshotDescription)
    return 0

def sshVMMenu():
    con_err = sshVM()
    res_err = VM_NOT_PAUSED
    if con_err == SSH_CON_REFUSED:
        res_err = resumeVM("stderr")
        time.sleep(2)
        con_err = sshVM()
        if con_err == SSH_CON_REFUSED:
            startVM()
            while con_err == SSH_CON_REFUSED:
                time.sleep(2)
                con_err = sshVM()
    if res_err != VM_NOT_PAUSED:
        pauseVM()
    return 0

def runMenu(menu_choice: int):
    if menu_choice < 0:
        exit(1)
    elif menu_choice == 0:
        exit(0)
    elif menu_choice == 1:
        sshVMMenu()
    elif menu_choice == 2:
        scpToGuestVMMenu()
    elif menu_choice == 3:
        scpToHostVMMenu()
    elif menu_choice == 4:
        startVM()
    elif menu_choice == 5:
        resumeVM()
    elif menu_choice == 6:
        pauseVM()
    elif menu_choice == 7:
        poweroffVM()
    elif menu_choice == 8:
        takeSnapshotVMMenu()
    else:
        exit(1)

if __name__ == '__main__':
    while True:
        displayMenu()
        menu_choice = getChoiceMenu()
        runMenu(menu_choice)
    exit(0)
