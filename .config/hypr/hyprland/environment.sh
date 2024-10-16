#!/bin/bash

# This script is used to set environment variables, based on which device is being used

# Get a identifier which device is in use right now (maybe change this in the future)
RESOLUTION=$(hyprctl monitors | grep -m1 "^  resolution" | awk '{print $2}')

# Set environment variables based on the resolution
if [ "$RESOLUTION" = "2560x1600" ]; then
    return
else
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
fi
