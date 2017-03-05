#!/usr/bin/env bash
# http://bit.ly/2msEB5T
# Generic update
sudo apt-get update
sudo apt-get upgrade

# All the packages needed for everything in this script to work
sudo apt-get install openssl libcurl4-openssl-dev libxml2 libssl-dev libxml2-dev pinentry-curses xclip git cmake gcc g++ pkg-config

# Optional packages
sudo apt-get install tmux open-ssh


# Setup for lastpass
mkdir -p ~/.local/share
mkdir ~/.config
git clone https://github.com/lastpass/lastpass-cli.git
cd lastpass-cli
cmake . && make
sudo make install
lpass login injpk23@gmail.com

# Get private SSH key from lastpass
lpass show --notes dockergitsshkey > ~/.ssh/id_rsa
lpass show --field="Public Key" dockergitsshkey > ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

# Prep SSH key with GitHub
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
ssh -T git@github.com

# Get this Scripts repo
mkdir ~/Projects
cd ~/Projects
git clone git@github.com:asclines/Scripts.git
cd ./Scripts
bash install.sh
