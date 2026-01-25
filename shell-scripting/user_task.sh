#!/bin/bash

<<help
This script helps do multiple works like Account creation, Account deletion, Password reset, list user accounts, etc. 
help

create_user() {
	echo "======User creation started======"
	read -p "Enter the username : " username
	
	#approch 1
	#if id "$username" &>/dev/null; then
	#	echo "Error: username '$username' already exist"
	#	exit 1
	#fi
	
	#approch 2
	#is_user_exist=$(cat /etc/passwd | grep "$username")
	#echo "is user exist '$is_user_exist'"
	#if [ ${#is_user_exist} -gt 0 ]; then
	#	echo "Error: Username '$username; alreaddy exist"
	#	exit 1
	#fi
	
	#approch 3
	if grep "^$username" /etc/passwd &>/dev/null ; then
		echo "Error: Username '$username' already exist"
		exit 1
	fi
	read -sp "Enter password : " password
	#-m means also create a home directory
	sudo useradd -m $username

	echo -e "$password\n$password" | sudo passwd $username

	echo "======User Created Successfully======"

}

delete_user() {
	echo "======User deletion process started======"

	read -p "Enter the username : " username

	if ! id "$username" &>/dev/null; then
		echo "Error: user not found"
		exit 1
	fi
	#-r means also remove home directory
	sudo userdel -r $username &>/dev/null

	if [ $? -eq 0 ] ; then
		echo "User deleted successfully"
	else
		echo "User not deleted"
	fi
}

reset_password() {
	echo "======User password reset process started======"

	read -p "Enter the username to reset password: " username

	if ! id "$username" &>/dev/null; then 
	       echo "User not found"
       	       exit 1
	fi
	
	read -sp "Enter your new password : " password
	echo "$username:$password" | sudo chpasswd
	
	if [ $? -eq 0 ]; then
		echo "======Password reset successfully======"
	else
		echo "======Password not changed======"
	fi	
		
}

list_all_users() {

	echo "======Listing All the users======"
	echo "---------------------------------"
	cat /etc/passwd | awk -F: '{print "Username:", $1 , ", UID:", $3}'
	echo "-----------------------------------"
}

help() {
	echo "======Help started here======"
	echo "Usage: user_management.sh [OPTION]"
	echo "Options for managing user accounts:"
	echo "----------------------------------------------------"
	echo "  -c, --create    Create a new user account"
	echo "  -d, --delete    Delete an existing user account"
	echo "  -r, --reset     Reset the password of an existing user account"
	echo "  -l, --list      List all user accounts on the system"
	echo "  -h, --help      Display this help message"
	echo "----------------------------------------------------"
}
case "$1" in
    -c | --create)
	    create_user
	    ;;
    -d | --delete)
	    delete_user
	    ;;
    -r | --reset)
	    reset_password
	    ;;
    -l | --list)
	    list_all_users
	    ;;
    -h | --help)
	    help
	    ;;
    *)
	    echo "invalid argument"
	    ;;
esac
