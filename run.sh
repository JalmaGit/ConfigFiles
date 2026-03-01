#!/bin/bash

print_usage(){
	echo ""
	echo " This script is for quickly setting up new systems, aswell as fetching local configs"
	echo ""
	echo " Usage"
	echo "  Option 1: (NVIDIA GPU Required)"
	echo "   source run.sh setup"
	echo ""
	echo "  Option 2:"
	echo "   source run.sh fetch"
	echo ""
}

if [ "$1" = "fetch" ]; then
	echo "Fetching local config files"
	source scripts/fetch_local_files.sh
elif [ "$1" = "setup" ]; then
	echo "Automatic setup and configuration of system will start"
	source scripts/distro_selector.sh
else 
	print_usage
	return
fi

echo "Do you want to reboot?"
options=("Yes" "No")

select opt in "${options[@]}"
do
  case $opt in
        "Yes")
            echo "Rebooting now..."
            reboot
            break
            ;;
        "No")
            echo "Reboot aborted."
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done

