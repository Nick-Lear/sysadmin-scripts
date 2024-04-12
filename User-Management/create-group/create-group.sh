#!/bin/bash

# Function to display how to / usage 
howto() {
	echo "Usage: $0 <new group>"
	echo "Creates a new group with provided <new group> name"
	exit 1
}

# Checking if the user is root
if [ "$(id -u)" -ne 0 ]; then
	echo "You must have superuser privileges to run this script." 1>&2
	exit 1
fi

# Function checking if group exists
GROUP_CHECK() {
	local GROUP=$1
	if grep -q "^$GROUP:" /etc/group; then
		echo "Group '$GROUP' already exists. Aborting."
		exit 1
	fi
}

# Function creating the group

GROUP_CREATE() {
	local GROUP=$1
	groupadd "$GROUP"
	echo "Group '$GROUP' created."
}

# Assembly of the various functions
main() {
	# Making sure the new group's name has been provided
	if [ $# -ne 1 ]; then
		howto
	fi

	local GROUP=$1

	# Checking if group exists
	GROUP_CHECK "$GROUP"

	# Creating the group
	GROUP_CREATE "$GROUP"
}

# Calling main
main "$@"
