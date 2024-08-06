#!/bin/bash

# Get Battery charge
battery_charge=$(cat /sys/class/power_supply/BAT0/capacity)

printf "Battery %d%%\n" "$battery_charge"