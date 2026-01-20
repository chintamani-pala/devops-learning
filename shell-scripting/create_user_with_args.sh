#!/bin/bash

<<help
This script takes username and password as an argument and create the user
ex: ./create_user_with_args.sh [username] [password]
help

echo "======User Creation Started======"

sudo useradd -m "$1"

echo "====Adding password to user $1===="

echo -e "$2\n$2" | sudo passwd "$1"

echo "======User Creation completed======"

