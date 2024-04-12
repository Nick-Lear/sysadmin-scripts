#!/bin/bash

# Function for help information / usage
howto() {
	echo "Usage: $0 [ARGUMENTS]"
	echo "Options:"
	echo "REQUIRED"
	echo " -s, --source	Source file/directory being backed up"
	echo " -d, --dest	Filesystem destination of file/directory being backed up"
	echo " -r, --remote	Remote device address"
	echo "OPTIONAL"
	echo " -p, --port	SSH port if not default of 22 (if unspecified, will use 22)"
	echo " -o, --rsync-options	Allows use of additional rsync options"
	exit 1
}

# Parsing options
while [[ $# -gt 0 ]]; do
	key="$1"
	case $key in
		-s|--source)
			SOURCE="$2"
			shift
			shift
			;;
		-d|--dest)
			DEST="$2"
			shift
			shift
			;;
		-r|--remote)
			REMOTE="$2"
			shift
			shift
			;;
		-p|--port)
			PORT="$2"
			shift
			shift
			;;
		-o|--rsync-options)
			RSYNC_OPTIONS="$2"
			shift
			shift
			;;
		*)
			echo "Unknown or otherwise invalid option: $1"
			howto
			;;
	esac
done

# Checking for required options
echo "Checking for required options..."
if [ -z "$SOURCE" ] || [ -z "$DEST" ] || [ -z "$REMOTE" ]; then
	echo "Command failed. Required inputs are not provided or are invalid."
	usage
fi

# Default SSH port
PORT=${PORT:-22}

# Assembling BACKUP command
BACKUP="rsync -avz -e 'ssh -p $PORT' $RSYNC_OPTIONS $SOURCE $REMOTE:$DEST"


# Running the assembled BACKUP command with context
echo "Starting..."
eval "$BACKUP"
echo "Completed."

