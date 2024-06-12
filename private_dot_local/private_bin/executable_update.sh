#!/bin/bash

# Check if script is run as sudo
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root (sudo)." 1>&2
    exit 1
fi

usage() {
    echo "Usage: sudo $0 [-y] [-r]" 1>&2
    echo "  -y  Automatically confirm updates" 1>&2
    echo "  -r  Reboot after updates" 1>&2
    echo "  -s  Reboot after updates" 1>&2
    echo "  --help  Display this help message" 1>&2
    exit 1
}

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -y )
            YES_FLAG=true
            ;;
        -r )
            REBOOT_FLAG=true
            ;;
        -s )
            SHUTDOWN_FLAG=true
            ;;
        --help )
            usage
            ;;
        * )
            echo "Invalid option: $1" 1>&2
            usage
            ;;
    esac
    shift
done

echo "Running system update..."
if [ "$YES_FLAG" = true ]; then
    sudo zypper dup -y
else
    sudo zypper dup
fi

echo "Updating flatpaks..."
if [ "$YES_FLAG" = true ]; then
    sudo flatpak update -y
else
    sudo flatpak update
fi

echo "Update process complete."

if [ "$REBOOT_FLAG" = true ]; then
    echo "Rebooting system..."
    sudo shutdown -r now
fi

if [ "$SHUTDOWN_FLAG" = true ]; then
    echo "Shutting down system..."
    sudo shutdown now
fi