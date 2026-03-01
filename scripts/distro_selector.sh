#!/bin/bash

linux_distro=$(grep 'PRETTY_NAME' /etc/os-release | cut -d '"' -f2)

echo "Detected: ${linux_distro}"

case ${linux_distro} in
	"Ubuntu Linux 22.04 (Jammy Jellyfish") echo "Comming Soon...";;
	"Fedora Linux 43 (Workstation Edition)") source scripts/distros/fedora_43.sh;;
esac
