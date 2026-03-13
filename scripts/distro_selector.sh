#!/bin/bash

linux_distro=$(grep 'PRETTY_NAME' /etc/os-release | cut -d '"' -f2)

echo "Detected: ${linux_distro}"

case ${linux_distro} in
	"Ubuntu Linux 22.04 (Jammy Jellyfish)") echo "Coming Soon...";;
	"Linux Mint 22.2") source scripts/distros/mint_22.sh;;
	"Fedora Linux 43 (Workstation Edition)") source scripts/distros/fedora_43.sh;;
	*) echo "Unsupported distribution: ${linux_distro}";;
esac
