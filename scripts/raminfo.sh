#!/bin/bash

# Get RAM utilization
ram_free=$(free -m | awk 'NR==2 {print $3/$2 * 100}')

# Get RAM temperature using sensors command
ram_temp=$(sensors | awk '/temp1/ {print $2}' | sed 's/+//' | sed -E 's/[^0-9]*([0-9]+).*/\1/')

printf "RAM %.1f%% %d°C\n" "$ram_free" "$ram_temp"