#!/usr/bin/env bash
# Sets up a R development environment on an Ubuntu system

# Get the distro version to install the right cran source
DIST_VERSION="$(lsb_release -a | grep Codename | cut -d$'\t' -f2)"

# Add the cran source to sources

# Authenticate
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu $DIST_VERSION/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

# Update and install R
sudo apt-get update
sudo apt-get -y install r-base

# Install R devtools (used to get packages from GitHub)
sudo apt-get -y install libcurl4-gnutls-dev libxml2-dev libssl-dev
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
