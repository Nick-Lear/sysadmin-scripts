# staticip.sh README
***************
## What does this do?
This is a small script to assign a static IP to a network interface using the command line. This script requires superuser privileges. 
 
## How to / Usage
Entering the command `./staticip.sh` with no options or arguments (or not enough options or arguments) will output a brief 'How to' message. 

Run the script (with sudo) with the desired interface's name, the IP address to be assigned, the netmask desired, and the gateway desired, and once the script has determined that you have superuser privileges it will proceed with assigning the provided values to the interface specified via the /etc/networking/interfaces file. The script should display the options being added to the file to the terminal for review as well as output confirmation that the changes have been completed after restating the networking services atuomatically.

## Setting permissions
In order for the command to be executable, it will need to be given execute permissions via:

`sudo chmod +x staticip.sh`
OR
`sudo chmod 755 staticip.sh`


## Syntax
Example with minimum required options:

`./staticip.sh INTERFACE IP_ADDRESS NETMASK GATEWAY`

`./staticip.sh eth0 192.168.1.10 255.255.255.0 192.168.1.0`
