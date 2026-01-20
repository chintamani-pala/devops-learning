#!/bin/bash

<<help
This script takes an username and delete that user from system
help

echo "======User Deletion Started======"

read -p "Enter the usernae which you want to delete : "  username
sudo userdel $username
echo "====User deleted===="
echo "====Checking is really user deleted or not===="
userdel=sudo cat /etc/passwd | grep $username | wc -l
if [[ $userdel -eq 0 ]]; then
	echo "====User is actually deleted===="
fi
echo "======User Deletion Completed======"

