#!/bin/bash

<<help
This  is  a shell scriot demonstate how to use functions in shell-scripting
help

function createUser {
	read -p "Enter username : " username
	sudo useradd -m $username
	echo "User $username created successfully"
}

for (( num=1 ; num<=5 ; num++ )) 
do
	createUser
done
