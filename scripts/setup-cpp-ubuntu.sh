#!/usr/bin/env bash
# Sets up a C++11 development environment on an Ubuntu system

sudo add-apt-repository ppa:ubuntu-toolchain-r/test

# Generic update
sudo apt-get update
sudo apt-get upgrade

# Install clang & clang format
sudo apt-get install clang clang-format-3.8 g++-4.9
