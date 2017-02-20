#!/bin/bash
################################################################################
# install.sh
# This script creates symlinks and copies files as needed.
# NOTE: Only for Ubuntu distros currently
################################################################################

# Variables
O_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOGS=$DIR/Logs
BUD=~/.dotfiles_old #Back Up Directory

# Make Logs folder
mkdir -o $LOGS

# Create dotfiles backup folder
echo  "Creating $BUD for backing up initial dotfiles"
mkdir -p $BUD
echo "Done"
echo " "
