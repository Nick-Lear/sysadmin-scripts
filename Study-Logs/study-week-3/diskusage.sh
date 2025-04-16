#!/bin/bash

#This is a simple script that will run the 'du' command and output the contents to a file '/var/log/diskusage.log' once a week via crontab

#Variables
OUTPUT_FILE="/var/log/diskusage.log"
DIRECTORY="/home/admin"
DATE=$(date)

#Script
du -sh $DIRECTORY > $OUTPUT_FILE
echo $DATE >> $OUTPUT_FILE
