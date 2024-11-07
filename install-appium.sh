#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

#====================================
# Install appium
#====================================
echo "Installing Appium version ${APPIUM_VERSION}..."
npm install -g appium@${APPIUM_VERSION}

#====================================
# Install UiAutomator2
#====================================
echo "Installing UiAutomator2 driver version ${UIAUTOMATOR_VERSION}..."
appium driver install uiautomator2@${UIAUTOMATOR_VERSION}

#====================================
# Install Device-Farm Plugin
#====================================
echo "Installing Appium Device-Farm plugin version ${DEVICE_FARM_VERSION}..."
appium plugin install --source=npm appium-device-farm@${DEVICE_FARM_VERSION}

#====================================
# Cleanning Up
#====================================
echo "Cleaning up unnecessary files..."
npm cache clean --force
apt-get purge -y npm && \
apt-get autoremove -y && \
apt-get clean && \
rm -rf /tmp/* /var/lib/apt/lists/*

echo "Appium installation completed successfully."