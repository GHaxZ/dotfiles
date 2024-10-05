#!/bin/bash

# Calculate the average CPU temperature
average_temp=$(sensors | awk '/Tctl/ {print $2}' | tr -d '°C')

# Calculate the average CPU utilization
average_util=$(top -bn1 | awk '/%Cpu/{sum += $2; count++} END {print sum / count}')

printf "CPU %.1f%% %.0f°C\n" "$average_util" "$average_temp"
