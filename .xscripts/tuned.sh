#!/bin/sh

get_active_profile() {
    tuned-adm active | awk '{print $4}'
}

set_tuned_profile() {
    profile=$1
    tuned-adm profile $profile
}

charging_profile="latency-performance"
discharging_profile="balanced"

tune()
{
	if [ -d /sys/class/power_supply/BAT0 ]; then
		charging=$(cat /sys/class/power_supply/BAT0/status)
    current_profile=$(get_active_profile)
    if [[ "$charging" != "Discharging" ]]; then # charging
      if [ "$current_profile" != "$charging_profile" ]; then
        set_tuned_profile "$charging_profile"
      fi
    else # not charging
      if [ "$current_profile" != "$discharging_profile" ]; then
          set_tuned_profile "$discharging_profile"
      fi
    fi
  fi
}

while true; do
  tune
  sleep 60
done
