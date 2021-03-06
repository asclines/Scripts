#!/usr/bin/env bash
# Sets up a Node.js development environment on an Ubuntu system

# Generic update
sudo apt-get update
sudo apt-get upgrade

# Install NVM
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
#source ~/.bashrc

# Setup NVM
#nvm install --lts
#nvm install node
#nvm use node

# Setup N
curl -L https://git.io/n-install | bash -s -- -y lts stable
#curl -0 -L https://npmjs.com/install.sh | sudo sh # if npm isn't working
source ~/.bashrc

# Setup eslint
npm install -g eslint eslint-plugin-chai-friendly

(
  export PKG=eslint-config-airbnb;
    npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$PKG@latest"
)
