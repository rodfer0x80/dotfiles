#!/bin/sh

# Prints out the CPU load percentage
get_cpuload()
{
  PREFIX=' '
  # Get the first line with aggregate of all CPUs
  CPU_LAST=($(head -n1 /proc/stat))
  CPU_LAST_SUM="${CPU_LAST[@]:1}"
  CPU_LAST_SUM=$((${CPU_LAST_SUM// /+}))

  sleep 0.05

  CPU_NOW=($(head -n1 /proc/stat))
  CPU_SUM="${CPU_NOW[@]:1}"
  CPU_SUM=$((${CPU_SUM// /+}))

  CPU_DELTA=$((CPU_SUM - CPU_LAST_SUM))
  CPU_IDLE=$((CPU_NOW[4]- CPU_LAST[4]))
  CPU_USED=$((CPU_DELTA - CPU_IDLE))
  CPU_USAGE=$((100 * CPU_USED / CPU_DELTA))

  # Keep this as last for our next read
  CPU_LAST=("${CPU_NOW[@]}")
  CPU_LAST_SUM=$CPU_SUM

  echo "$PREFIX$CPU_USAGE%"
}

get_cpuload
