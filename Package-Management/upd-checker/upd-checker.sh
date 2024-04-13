#!/bin/bash

# Ensure user has superuser privileges.
if [[ $EUID -ne 0 ]]; then
	echo "You must have superuser privileges to use this."
	exit 1
fi

# Update packages
echo "Checking for updates to packages..."
yum check-update -q

# Upgrade any updated packages
echo "Upgrading available packages..."
yum update -y

# Remove extra files
echo "Cleaning up..."
yum autoremove -y

echo "All done. :)"
