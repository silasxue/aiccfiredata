#!/bin/bash -l

FILES='*'

if [ $# -ge 1 ]; then
	FILES=$1
fi

rsync -rldpvz --update --dry-run ./firesforwrf/$FILES cwaigl@chinook.alaska.edu:/center1/d/UAFSMOKE/dat/fires_data/FIRMS_merged/

read -p "Continue uploading files (y/N)? " confirm
if [ "$confirm" != "y" ]; then
    echo "Aborting"
    exit 1
fi

rsync -rldpvz --update ./firesforwrf/$FILES cwaigl@chinook.alaska.edu:/center1/d/UAFSMOKE/dat/fires_data/FIRMS_merged/