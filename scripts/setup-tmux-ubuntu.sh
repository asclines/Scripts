#!/usr/bin/env bash
# Sets up Ttmux with latest version on an Ubuntu system

# Generic update
sudo apt-get update
sudo apt-get upgrade

# Install dependencies 
sudo apt-get install -y python-software-properties software-properties-common

# Add PPA
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update

# Install Tmux
sudo apt-get install tmux
