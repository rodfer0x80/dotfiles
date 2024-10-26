#!/bin/sh

VOL="2%+"

# cap volume at 100 when cap=true
cap=true
if [ cap ]; then
  cap_value="$(wpctl get-volume @DEFAULT_SINK@ | awk -F'[ .]' '{print $2}')"
  if [ "$cap_value" != "1" ]; then
    wpctl set-volume @DEFAULT_SINK@ "$VOL"
  fi
else
    wpctl set-volume @DEFAULT_SINK@ "$VOL"
fi
exit 0
