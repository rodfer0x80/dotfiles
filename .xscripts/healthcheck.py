#!/usr/bin/python3


import time
import sys
import shutil
import psutil
import threading
import multiprocessing.pool


# Threadpool switches
flag = True
mutex = dict()
mutex_lock = False


def get_net_bytes(t, iface='wlan0'):
    with open('/sys/class/net/' + iface + '/statistics/' + t + '_bytes', 'r') as f:
        data = f.read();
        return int(data)


def thread_net_speed():
    global flag, mutex, mutex_lock
    (tx_prev, rx_prev) = (0, 0)
    while flag:
        output = 'Net:\n\t'
        tx = get_net_bytes('tx')
        rx = get_net_bytes('rx')
        if tx_prev > 0:
            tx_speed = tx - tx_prev
            output += f'TX: {tx_speed} bps'
        else:
            output += 'TX: 0 bps'
        output += "\n\t"
        if rx_prev > 0:
            rx_speed = rx - rx_prev
            output += f'RX: {rx_speed} bps'
        else:
            output += 'RX: 0 bps'
        tx_prev = tx
        rx_prev = rx
        while mutex_lock:
            time.sleep(1)
        mutex_lock = True
        mutex['net_speed'] = output
        mutex_lock = False
        time.sleep(1)
    exit(0)


def thread_cpu_usage():
    global flag, mutex, mutex_lock
    while flag:
        output = ""
        usage = psutil.cpu_percent(1)
        with open('/sys/class/thermal/thermal_zone9/temp', 'r') as f:
            thermal = f.read()
        output += f"CPU:\n\tU: {usage}%\n\tT: {thermal[:2]}.{thermal[2:4]} Celsius"
        while mutex_lock:
            time.sleep(1)
        mutex_lock = True
        mutex['cpu_usage'] = output
        mutex_lock = False
        time.sleep(1)
    exit(0)


def thread_disk_usage():
    global flag, mutex, mutex_lock
    while flag:
        output = ""
        du = shutil.disk_usage("/")
        free = du.free / du.total * 100
        output += f"Disk:\n\tT: {du.total} bytes\n\tU: {du.used} bytes\n\tF: {du.free} bytes :: {free:2.2f}%"
        while mutex_lock:
            time.sleep(1)
        mutex_lock = True
        mutex['disk_usage'] = output
        mutex_lock = False
        time.sleep(1)
    exit(0)


def create_threads():
    global mutex
    threads = list()
    mutex['net_speed'] = ""
    mutex['cpu_usage'] = ""
    mutex['disk_usage'] = ""
    threads.append(threading.Thread(target=thread_net_speed))
    threads.append(threading.Thread(target=thread_disk_usage))
    threads.append(threading.Thread(target=thread_cpu_usage))
    return threads


def run_threads(threads):
    global flag, qFlag
    for thread in threads:
        thread.start()
    #for thread in threads:
    #    thread.join()
    #    print("laved")
    
    time.sleep(3)
    while flag:
        display_logs()
        time.sleep(1)
    return 0


def kill_threads():
    global flag
    print("[*] Gracefully quitting ... ")
    flag = False
    sys.stdout.flush()
    return 0


def display_logs():
    global mutex
    print("")
    print(mutex['net_speed'])
    print(mutex['cpu_usage'])
    print(mutex['disk_usage'])
    print("")
    return 0


def bootstrap():
    global flag
    try:
        threads = create_threads()
        run_threads(threads)
        exit(0)
    except KeyboardInterrupt:
        exit(kill_threads())


if __name__ == '__main__':
    bootstrap()
