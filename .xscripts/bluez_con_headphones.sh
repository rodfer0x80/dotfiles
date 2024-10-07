#!/bin/sh
hp_mac=""
hp_sink="bluez_output."+"$hp_mac"+".a2dp-sink"

bluetoothctl power on
bluetoothctl connect $hp_mac
pactl set-default-sink $hp_sink
