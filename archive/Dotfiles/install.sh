#!/bin/bash
############################
# install.sh
# This script creates symlinks and copies files as needed.
############################


# Variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOGS=$DIR/Logs
BUD=~/.dotfiles_old #Back Up Directory
ISSU=1 # Set to 1 if user cannot user sudo
OS=0 # 0 = Ubuntu ; 1 = RedHat/CentOS

get_os () {
	if [ -f /etc/redhat-release ]; then
		echo "Found Redhat/CentOS OS"
		OS=1
	elif [ -f /etc/debian_version ]; then
		echo "Found Debian/Ubuntu OS"
		OS=0
	fi
}

echo " "

while getopts ":S" opt; do
	case $opt in
		S) ISSU=0
		;;
	esac
done

get_os

# Create dotfiles backup folder
echo  "Creating $BUD for backing up initial dotfiles"

mkdir -p $BUD


echo "Done"
echo " "

echo "Linking files"
cd $DIR/link
for entry in *; do
	echo "Found $entry"
	if [ -f ~/.$entry ]; then
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

cd $DIR
echo "Done linking files"
echo " "

echo "Copying files"
cd $DIR/copy
for entry in *; do
	echo "Found $entry"
	if [ -f ~.$entry ]; then
		echo "Backing up old $entry files"
		mv ~/.$entry $BUD/
	fi

	echo "Copying $entry"
	cp $DIR/copy/$entry ~/.$entry

	echo " "
done

cd $DIR
echo "Done copying files"
echo " "

echo "Running install scripts"
cd $DIR/scripts

for script in *; do
	source $script

	echo "Checking for $(script_name)"
	if is_installed $OS; then
		echo "$(script_name) is installed"
		echo "Seting up $(script_name)"
		setup $DIR $BUD $OS $ISSU
	else
		echo "$(script_name) is not installed"
		if [ $ISSU = 1 ]; then
			echo "WARNING: Cannot install $(script_name), no sudo permissions"
		else
			echo "Would you like to install $(script_name)?"
			while true; do
				read -p "Please enter [y/n] then press [ENTER]:" yn
				case $yn in
					[Yy]* )
						echo "Installing $(script_name)"
						install $OS
					       	if is_installed $OS; then
							echo "Setting up $(script_name)"
							setup $DIR $BUD $OS $ISSU
						else
							echo "ERROR: Installation of $(script_name) failed!"
						fi
					       break;;
					[Nn]* )
						break;;
					* ) echo " "
				esac
			done


		fi
	fi
	cd $DIR/scripts
	echo " "
done
cd $DIR

echo "Done installing scripts"
echo " "



echo "Done installing dotfiles"
