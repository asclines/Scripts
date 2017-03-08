#!/usr/bin/env bash
# Sets up a R development environment on an Ubuntu system


DIST_VERSION="$(lsb_release -a | grep Codename | cut -d$'\t' -f2)"
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu $DIST_VERSION/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install r-base
