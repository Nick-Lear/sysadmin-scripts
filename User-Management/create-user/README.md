# create-user.sh README
***************
## What does this do?
This is a small script to create a new user on a linux system using one argument for a username and one prompt while it runs for a password. 
 
## How to / Usage
Entering the command `./create-user.sh` with no options or arguments will output a brief 'How to' message. 

Run the script (with sudo) with the desired username for the new user as the only argument provided, and once the script has determined that you have superuser privileges it will proceed with creating the user and asking for a password to assign to that user.

## Setting permissions

In order for the command to be executable, it will need to be given execute permissions via:

`sudo chmod +x create-user.sh`
OR
`sudo chmod 755 create-user.sh`


## Syntax

Example with minimum required options:

`./create-user.sh USERNAME`

`./create-user.sh Bob`
