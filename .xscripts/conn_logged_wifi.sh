#!/bin/sh
wpa_supplicant -c/etc/wpa_supplicant/uni_logged_wifi.conf -i wlan0 -D nl80211
