# create-group.sh README
***************
## What does this do?
This is a small script to create a new group on a linux system using one argument for a group name. The script will check that the user has provided a group name, that the user has superuser privileges, and that there are no groups by that name already. 
 
## How to / Usage
Entering the command `./create-group.sh` with no options or arguments will output a brief 'How to' message. 

Run the script (with sudo) with the desired group name for the new group as the only argument provided, and once the script has determined that you have superuser privileges it will proceed with creating the group if it is a unique group name.

## Setting permissions

In order for the command to be executable, it will need to be given execute permissions via:

`sudo chmod +x create-group.sh`
OR
`sudo chmod 755 create-group.sh`


## Syntax

Example with minimum required options:

`./create-group.sh NEWGROUP`

`./create-group.sh Accounting`
