# rsync-backup.sh README

*********************************************************************************************************************************************************************
I have removed all instances of personally identifiable information for the sake of privacy and security. This script will **NOT** run in its current form without minor adjustments to the **PLACEHOLDER** content.

*********************************************************************************************************************************************************************


This script uses rsync to create a copy of my local Linux PC's `/home/USERNAME` folder on the external drive located at `/run/media/USERNAME/SanDisk Backup 2`
This script will also:
 1.  exclude particular directories that do not require being backed up
 2.  utilize the --archive option to maintain ownership/permission for the files
 3.  utilize the -z option to compress files in transit
 4.  produce a local log file [/var/log/rsync-backup.log] for additional troubleshooting/debugging
 5.  display the progress of the transfer and the stats of the transfer upon completion


`rsync -raz --progress --stats --log-file=/var/log/rsync-backup.log /home/USERNAME --exclude={"/home/USERNAME/Games","/home/USERNAME/.steam\*","/home/USERNAME/unity3d"} /run/media/USERNAME/SanDisk\ Backup\ 2/`


