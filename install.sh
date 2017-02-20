#!/bin/bash
################################################################################
# install.sh
# This script creates symlinks and copies files as needed.
# NOTE: Only for Ubuntu distros currently
################################################################################

# Variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOGS=$DIR/Logs
BUD=~/.scripts_old #Back Up Directory

# Make Logs folder
mkdir -p $LOGS

# Create dotfiles backup folder
echo  "Creating $BUD for backing up initial dotfiles"
mkdir -p $BUD
echo "Done"
echo " "

echo "Linking files"
cd $DIR/link
for entry in *; do
	echo "Found $entry"
	if [ -f ~/.$entry ] && [ $entry != 'README.md' ]; then
		echo "Backing up old $entry files"
		mv ~/.$entry $BUD/
	elif [ -L ~/.$entry ]; then
		echo "Removing old $entry symlink"
		rm ~/.$entry
	fi

	echo "Linking $entry"
	ln -s $DIR/link/$entry ~/.$entry
	echo " "
done

# Link .bashrc.d
BASHRCDSRC=$DIR/bashrc.d
BASHRCDDEST=~/.bashrc.d
if [ -d $BASHRCDDEST ]; then
  echo "Backing up old $BASHRCDDEST folder"
  mv -f $BASHRCDDEST $BUD/
fi

ln -s $BASHRCDSRC/ $BASHRCDDEST

cd $DIR
echo "Done linking files"
echo " "


if [ -d ~/Projects ]; then
  echo "Creating bookmark Projects to ~/Projects"
  cd ~/Projects
  b Projects
  cd $DIR
  echo "Done"
fi
