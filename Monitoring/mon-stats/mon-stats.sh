#!/bin/bash

# Function for CPU usage
function CPU_USAGE {
	echo "CPU Usage: "
	top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
	echo " "
	echo " "
}

# Function for RAM usage
function RAM_USAGE {
	echo "Memory Usage: "
	free -m | grep Mem | awk '{printf "Total: %dMB\nUsed: %dMB\nFree: %dMB\n", $2, $3, $4}'
	echo " "
	echo " "
}

# Function for disk usage
function DISK_USAGE {
	echo "Disk Usage: "
	df -h | grep '/dev/' | awk '{printf "%s\nTotal: %s\nUsed: %s\nAvailable: %s\nUsage: %s\n\n", $1, $2, $3, $4, $5}'
	echo " "
	echo " "
}

# Function to refresh screen
function CLEAR {
	clear
}

# Assembling the above functions
while true
do
	CLEAR
	CPU_USAGE
	RAM_USAGE
	DISK_USAGE
	sleep 3
done


