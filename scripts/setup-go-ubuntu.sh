#!/usr/bin/env bash
# Sets up a Go development environment on an Ubuntu system

# Generic update
 sudo apt-get update
 sudo apt-get upgrade

 # Dependencies install
 sudo apt-get install curl git mercurial make binutils bison gcc build-essential

# Install GVM
 bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# First time sourcing of GVM
source ~/.gvm/scripts/gvm

# Add to bashrc
# echo "[[ -s "$HOME/.gvm/scripts/gvm" ]] && source \"$HOME/.gvm/scripts/gvm\""  >> ~/.bashrc

# Output version
gvm version

# Install Go 1.4 (Needed to install future Go versions due to bootstrapping)
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.5


