#!/bin/bash

<<help

This script is help to create a user by taking username and password

help

echo "======User Creation Started======"

read -p "Enter the username : " username

read -p "Enter the password : " password

sudo useradd -m "$username"

echo "====User is created, started settinup the password===="

echo -e "$password\n$password" | sudo passwd "$username"

echo "=====User creation is Completed======"
