#!/bin/bash

print_usage(){
	echo ""
	echo " This script is for quickly setting up new systems, aswell as fetching local configs"
	echo ""
	echo " Usage"
	echo "  Option 1: (NVIDIA GPU Required)"
	echo "   source run.sh setup"
	echo ""
	echo "  Option 2: Use this fetch local files such that they can be pused to remote"
	echo "   source run.sh fetch"
	echo ""
	echo "  Option 3: Use this to synchronize local machine with remote"
	echo "   source run.sh sync"
	echo ""
}

print_starting(){
	echo ""
	echo "in 3..."
	sleep 1
	echo "in 2..."
	sleep 1
	echo "in 1..."
	sleep 1
	echo "..."
	sleep 0.25
}

reboot_sequence(){
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

}

if [ "$1" = "fetch" ]; then
	echo "Fetching local config files"
	print_starting
	source scripts/fetch_local_files.sh
elif [ "$1" = "setup" ]; then
	echo "Automatic setup and configuration of system will start"
	print_starting
	source scripts/distro_selector.sh
elif [ "$1" = "sync" ]; then
	echo "synchronizing local files with repo files"
	print_starting
	source scripts/synchronize_local_files.sh
else
	print_usage
	return
fi


