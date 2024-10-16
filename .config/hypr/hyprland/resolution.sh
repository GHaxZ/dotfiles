#!/bin/bash

# This script is used to set environment variables related to different resolutions

# Get the resolution of the first connected monitor
RESOLUTION=$(hyprctl monitors | grep -m1 "^  resolution" | awk '{print $2}')

# Set environment variables based on the resolution
if [ "$RESOLUTION" = "2560x1600" ]; then
    # 2560x1600 screens
    export QT_SCALE_FACTOR=1.5
    export GDK_SCALE=1.5
    export XCURSOR_SIZE=48
else
    # Default (1080p screens)
    export GDK_SCALE=1
    export QT_SCALE_FACTOR=1
    export XCURSOR_SIZE=24
fi
