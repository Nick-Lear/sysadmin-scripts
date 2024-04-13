# mon-stats.sh README
***************
## What does this do?
This script utilizes a couple different commands bundled into one to  produce a simple, legible output to monitor some basic system performance including CPU usage, memory usage, and disk space. This command will also refresh itself every 3 seconds to display updated information.

Commands being used:
- 'top' is used to retrieve CPU usage information
- 'free' is used to retrieve memory information
- 'df' is used to retrieve disk information
 
## How to / Usage
Run the script as is, superuser permissions are not required.

Output will be presented as:

```
CPU Usage:
X%

Memory Usage:  
Total:
Used:
Free:

Disk Usage:
DISK NAME
Total: XMB
Used: XMB
Available: XMB
Usage: X% 
``` 



## Setting permissions

In order for the command to be executable, it will need to be given execute permissions via:

`sudo chmod +x mon-stats.sh`
OR
`sudo chmod 755 mon-stats.sh`


## Syntax

Example with minimum required options:

`./mon-stats.sh`
