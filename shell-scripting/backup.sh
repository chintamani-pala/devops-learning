#!/bin/bash

<<help
This shell script will take periodic backups
eg.
./backup.sh <source> <dest>
src /home/ubuntu/scripts
dest /home/ubuntu/backups
help

src=$1
dest=$2

echo "======Backup Started======"
current_time=$(date '+%d-%m-%4Y-%H-%M-%S')
zip -r "$dest/backup-$current_time.zip" $src > /dev/null

aws s3 sync $dest "s3://learn-linux-backup"
echo "======Bckup Completed & uploaded to s3======"
