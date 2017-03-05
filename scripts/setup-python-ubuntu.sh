#!/usr/bin/env bash
# Sets up a Python development environment on an Ubuntu system

# Generic update
sudo apt-get update
sudo apt-get upgrade

# Install python 2 & 3
sudo apt-get install python2.7 python3

# Install pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python2.7 get-pip.py
sudo python3 get-pip.py

rm get-pip.py
