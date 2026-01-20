#!/bin/bash


<<help
This script helps user to install a package into the system
eg.
	./install_package.sh docker.io

help

echo "Installing $1"

sudo apt update -y > /dev/null

sudo apt install $1 -y > /dev/null

echo "Installation Completed"
