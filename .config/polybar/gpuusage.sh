#!/bin/bash
trap "echo; exit" INT # print newline after ctrl-c
printf -v device_gpu_temp "%s" \
    /sys/devices/pci0000:00/0000:00:03.1/0000:1f:00.0/drm/card0/card0-HDMI-A-1/device/device/hwmon/hwmon1
previous_minute=99
while true; do
    time=$(date '+%T')
    minute=${time#*:}
    minute=${time%:*}
    if [[ $previous_minute != $minute ]]; then
        previous_minute=$minute
        echo
        echo -n "$time - "
    fi
    read -r gpu_temp < "$device_gpu_temp"
    echo -n "${gpu_temp%???} "
    sleep 2
done
