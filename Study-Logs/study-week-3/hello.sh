#!/bin/bash

#This is a short, basic script that should output "Hello from systemd" once every minute to a file /var/log/hello.log

#Variables -- Not typically necessary for something this simple, but included to make it modular just in case
FILE="/var/log/hello.log"
MESSAGE="Hello from systemd"

#Check if the user is root/superuser
if [ "$(id -u)" -ne 0 ]; then
	echo "You must have superuser privileges to run this script." 1>&2
	exit 1
fi


#Loop to run the script every 60s
while true; do
	echo $MESSAGE | tee -a $FILE > /dev/null #"| tee -a" required to avoid echo permission errors when writing to /var directory
	sleep 60 #Sleep 60s and run again, always true
done



