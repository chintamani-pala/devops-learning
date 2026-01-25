#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./backup_with_rotation.sh <directory_path>"
    exit 1
fi


target_dir="$1"
new_backup_dir_name="backup_$(date '+%4Y_%m_%d_%H_%M_%S')"
backup_path="$target_dir/$new_backup_dir_name"

if [ ! -d "$target_dir" ]; then
    echo "Error: Directory '$target_dir' does not exist."
    exit 1
fi

mkdir -p "$backup_path"

if [ $? -ne 0 ]; then
	echo "Something went wrong"
	exit 1
fi
zip -r "$backup_path/$new_backup_dir_name.zip" "$target_dir" -x "*/backup_*/*"

if [ $? -ne 0 ]; then
	echo "Something went wrong"
	exit 1
fi
echo "Backup created: $target_dir/$new_backup_dir_name"
echo "Removing old backups..."

backups=($(ls -d $target_dir/backup_* | sort -r))
if [ ${#backups[@]} -gt 3 ] ; then
	echo "Found ${#backups[@]} backups. Rotating (keeping last 3)..."
	for (( i=3; i<${#backups[@]}; i++ )); do
		echo "Removing old backup ${backups[$i]}"
		rm -rf "${backups[$i]}"
	done
fi
echo "Old Backup remove completed"
