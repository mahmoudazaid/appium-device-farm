#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

#====================================
# Install latest nodejs
#====================================
echo "Installing Node.js version ${NODE_VERSION}..."
curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -
apt-get install -y --no-install-recommends nodejs

#====================================
# Install latest npm
#====================================
echo "Installing npm version ${NPM_VERSION}..."
npm install -g npm@${NPM_VERSION}

#====================================
# Cleaning Up
#====================================
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
echo "Node.js and npm installation completed successfully."
