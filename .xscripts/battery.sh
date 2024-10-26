#!/bin/bash

# Prints out battery percentage

CHARGING_ICON=''
WARNING_ICON=''
BATTERY_FULL_ICON='󰁹'
BATTERY_90_ICON='󰂂'
BATTERY_80_ICON='󰂁'
BATTERY_70_ICON='󰂀'
BATTERY_60_ICON='󰁿'
BATTERY_50_ICON='󰁾'
BATTERY_40_ICON='󰁽'
BATTERY_30_ICON='󰁼'
BATTERY_20_ICON='󰁻'
BATTERY_10_ICON='󰁺'
BATTERY_5_ICON='󰂎'

FULL_AT=99

BAT_ICON=""
ICON=""

get_battery()
{
	# The vast majority of people only use one battery.

	if [ -d /sys/class/power_supply/BAT0 ]; then
		capacity=$(cat /sys/class/power_supply/BAT0/capacity)
		charging=$(cat /sys/class/power_supply/BAT0/status)
    if [[ "$charging" != "Discharging" ]]; then
			ICON="$CHARGING_ICON "
		elif [[ $capacity -le 20 ]]; then
			ICON="$WARNING_ICON "
		fi

		if [[ $capacity -ge $FULL_AT ]]; then
			BAT_ICON=$BATTERY_FULL_ICON
		elif [[ $capacity -le 10 ]]; then
			BAT_ICON=$BATTERY_5_ICON
		elif [[ $capacity -le 20 ]]; then
			BAT_ICON=$BATTERY_10_ICON
		elif [[ $capacity -le 30 ]]; then
			BAT_ICON=$BATTERY_20_ICON
		elif [[ $capacity -le 40 ]]; then
			BAT_ICON=$BATTERY_30_ICON
		elif [[ $capacity -le 50 ]]; then
			BAT_ICON=$BATTERY_40_ICON
		elif [[ $capacity -le 60 ]]; then
			BAT_ICON=$BATTERY_50_ICON
		elif [[ $capacity -le 70 ]]; then
			BAT_ICON=$BATTERY_60_ICON
		elif [[ $capacity -le 80 ]]; then
			BAT_ICON=$BATTERY_70_ICON
		elif [[ $capacity -le 90 ]]; then
			BAT_ICON=$BATTERY_80_ICON
		elif [[ $capacity -le $FULL_AT ]]; then
			BAT_ICON=$BATTERY_90_ICON
		fi
	fi
    if [[ $capacity -ge $FULL_AT ]]; then
        capacity=100
    fi
    echo "$ICON$BAT_ICON $capacity%"
}

get_battery
