#!/bin/bash -xe

# update apt index and upgrade all packages to latest version
apt update && apt upgrade -y

# Install basic packages for Nodejs and Reactjs application
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Check NodeJS version
node -v

# Upgrade NPM package
sudo npm install -g npm@latest

# Check NPM version
npm -v