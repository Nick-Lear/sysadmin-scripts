# remote-backup.sh README
***************
## What does this do?
This is a script that utilizes rsync to take files that are stored on the local machine and sends them to a remote machine using some easier to understand syntax with less options to make using rsync more digestable for myself and to reduce the number of arguments and options that I need to remember when using it.

As of writing, this is only capable of sending files from a local source to a remote destination. 
 
## How to / Usage
Entering the command `./remote-backup.sh` with no options or arguments will output a brief 'How to' message. 

## Setting permissions

In order for the command to be executable, it will need to be given execute permissions via:

`sudo chmod +x remote-backup.sh`
OR
`sudo chmod 755 remote-backup.sh`


## Syntax

Example with minimum required options:

`./remote-backup.sh -s /path/to/local/source -d /path/to/destination -r user@remoteserver`

`./remote-backup.sh -s /home/bob/documents/ -d /home/bob/homework/ -r bob@1.2.3.4`

Example with additional options:

`./remote-backup.sh -s /path/to/local/source -d /path/to/destination -r user@remoteserver -p 9999 -o "--ignore-existing"`

`./remote-backup.sh -s /home/bob/documents/ -d /home/bob/homework/ -r bob@1.2.3.4 -p 9999 -o "--ignore-existing"`

### Options

#### REQUIRED:
-s, --source | Location of the files being backed up on the local device.

-d, --dest | Location of where the files should be placed on the remote device.

-r, --remote | User and Address of remote device the files are being sent to.(i.e. user@remoteserver, bob@1.2.3.4)


#### OPTIONAL:
-p, --port | Port that SSH should use to communicate. Default is 22, unless specified specifically with this option. 

-o, --rsync-options | Allows passthrough of additional rsync options if needed. (i.e. -o "--ignore-existing" to skip updating existing files on destination server, or -o "--delete" to delete files that were not sent with this command in the destination directory.)
