#!/bin/bash

# Script to set a static IP to a specified network interface, restart the networking service, and confirm via stdout that the script has completed

# Function to display how to / usage
howto() {
	echo "Usage: $0 INTERFACE_NAME IP_ADDRESS NETMASK GATEWAY"
	echo "Assigns a static IP address to the provided network interface. All arguments are required."
	exit 1
}

# Ensure user has superuser privileges
if [[ $EUID -ne 0 ]]; then
	echo "You must have superuser privileges to use this command."
	exit 1
fi

# Ensure user has provided the necessary arguments for the command to function
if [ $# -ne 4 ];
	howto
fi


# Storing Provided Variables
INTERFACE=$1
IP_ADDRESS=$2
NETMASK=$3
GATEWAY=$4

# Create a backup of the current networking config
sudo cp /etc/network/interfaces /etc/network/interfaces.bak

# Configure the interface as provided, display changes to the terminal
echo "auto $INTERFACE" | sudo tee -a /etc/network/interfaces
echo "iface $INTERFACE inet static" | sudo tee -a /etc/network/interfaces
echo "address $IP_ADDRESS" | sudo tee -a /etc/network/interfaces
echo "netmask $NETMASK" | sudo tee -a /etc/network/interfaces
echo "gateway $GATEWAY" | sudo tee -a /etc/network/interfaces

# Restart the service
sudo systemctl restart networking

# Confirm to the user script is complete
echo "Network interface $INTERFACE is now set to the static IP of $IP_ADDRESS"
