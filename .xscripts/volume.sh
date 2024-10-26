#!/bin/sh

VOLUME_ON_ICON=''
VOLUME_MUTED_ICON=''

get_volume(){
  # get volumes from a.bc to bc% where a = 0 or b,c = 0
  cap="$(wpctl get-volume @DEFAULT_SINK@ | awk -F'[ .]' '{print $2}')"
  volume="$(wpctl get-volume @DEFAULT_SINK@ | awk -F'[ .]' '{print $3}')" 
  if [ "$cap" == "1" ]; then
    volume="$cap$volume"
  fi
  # matches '[MUTED]' when muted or '' when not muted
  vstatus="$(wpctl get-volume @DEFAULT_SINK@ | awk -F'[ .]' '{print $4}')"
  if [[ -z "${vstatus}" ]]; then
    echo "$VOLUME_ON_ICON $volume%"
    return 0
  else
    echo "$VOLUME_MUTED_ICON $volume%"
    return 0
  fi
  return 1
}

get_volume
exit $?
