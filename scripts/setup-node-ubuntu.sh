#!/usr/bin/env bash
# Sets up a Node.js development environment on an Ubuntu system

# Generic update
sudo apt-get update
sudo apt-get upgrade

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
source ~/.bashrc

# Setup NVM
nvm install --lts
nvm install node
nvm use node
