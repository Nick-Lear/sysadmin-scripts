#!/bin/bash

# Function for help information / usage
howto() {
	echo "Usage: $0 <username>"
	echo "Creates a new user with the given username"
	exit 1
}

# Check if user is root
if [ "$(id -u)" -ne 0 ]; then
	echo "You must have superuser privileges to perform this action." 1>&2
	exit 1
fi

# Check if a username has been given
if [ $# -ne 1]; then
	usage
fi

# Store given username from argument
NEWUSER=$1

# Check if they already exist
if id "$NEWUSER" &>/dev/null; then
	echo "User '$NEWUSER' already exists"
	exit 1
fi

# Prompt for password
read -sp "Enter password for $NEWUSER: " PASS
echo

# Create the user
useradd -m -s /bin/bash "$NEWUSER"

# Set the password
echo "$NEWUSER:$PASS" | chpasswd
echo "User '$NEWUSER' created and password set."
