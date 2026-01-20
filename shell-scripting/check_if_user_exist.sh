#!/bin/bash

<<help
This script takes an username and check is the user exist in the system or not
help

read -p "Enter username : " username

echo "======Checking the user existance======"

usercount=sudo cat /etc/passwd | grep $username | wc -l > /dev/null

if [[ $username -eq 0 ]]; then
	echo "User is not exist"
else
	echo "User is exist"
fi

echo "======User existance checking completed======"
