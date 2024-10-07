#!/bin/sh

# Gets temperature of the CPU
# Dependencies: lm_sensors
get_cputemp()
{
    PREFIX=' '
    FIRE='󰈸 '
    WARNING=' '

    WARM_LEVEL=60
    WARNING_LEVEL=75

	# CPU_T=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon?/temp2_input)
	# CPU_TEMP=$(expr $CPU_T / 1000)
    CPU_TEMP=$(sensors | grep "CPU:" | cut -d'+' -f2)

	#CPU_TEMP="$(sensors | grep temp1 | awk 'NR==1{gsub("+", " "); gsub("\\..", " "); print $2}')"
    TEMP=$(echo $CPU_TEMP | cut -d"." -f1)
    if [[ $TEMP -ge $WARNING_LEVEL ]]; then
		  PREFIX="$PREFIX$WARNING"
	  elif [[ $TEMP -ge $WARM_LEVEL ]]; then
		  PREFIX="$PREFIX$FIRE"
    fi

    echo "$PREFIX$CPU_TEMP"
}


get_cputemp
