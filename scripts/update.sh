#!/bin/bash

# Configuration (Change these values depending on your operating system)
UPDATE_COMMAND="zypper dup" # The command which is typically run to update the system (depends on your package manager)

# Check if script is run as sudo
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root (sudo)." 1>&2
	exit 1
fi

# Print usage help
usage() {
	echo "Usage: sudo $0 [-y] [-r]" 1>&2
	echo "  -y  Automatically confirm updates" 1>&2
	echo "  -r  Reboot after updates" 1>&2
	echo "  -s  Shutdown after updates" 1>&2
	echo "  --help  Display this help message" 1>&2
	exit 0
}

# Check all supplied arguments
while [[ "$#" -gt 0 ]]; do
	case "$1" in
	-y)
		YES_FLAG=true
		;;
	-r)
		REBOOT_FLAG=true
		;;
	-s)
		SHUTDOWN_FLAG=true
		;;
	--help)
		usage
		;;
	*)
		echo "Invalid option: $1" 1>&2
		usage
		;;
	esac
	shift
done

# Run the system update
echo "Running system update..."
if [ "$YES_FLAG" = true ]; then
	$UPDATE_COMMAND -y
else
	$UPDATE_COMMAND
fi

# Check for flatpak
if [ -x "$(command -v flatpak)" ]; then
  echo "Updating flatpaks..."
  if [ "$YES_FLAG" = true ]; then
    flatpak update -y
  else
    flatpak update
  fi
fi

echo "Update process complete."

# Reboot if -r flag was supplied
if [ "$REBOOT_FLAG" = true ]; then
	echo "Rebooting system..."
	shutdown -r now
fi

# Shutdown if -s flag was supplied
if [ "$SHUTDOWN_FLAG" = true ]; then
	echo "Shutting down system..."
	shutdown now
fi
