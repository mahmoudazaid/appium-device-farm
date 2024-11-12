#!/bin/bash

# Define colors for output
BL='\033[0;34m'
G='\033[0;32m'
RED='\033[0;31m'
YE='\033[1;33m'
NC='\033[0m' # No Color

function start_appium() {
    # Default to port 4723 if APPIUM_PORT is not set
    printf "${G}==> ${BL}Instance will run on port ${YE}${APPIUM_PORT} ${G}<==${NC}\n"
    
    # Start Appium with Device Farm plugin and specified port
    if ! appium server --ka 800 --use-plugins=device-farm --plugin-device-farm-platform=android -p "${APPIUM_PORT}" -pa /wd/hub; then
        printf "${RED}Error: Failed to start Appium server.${NC}\n"
        exit 1
    fi
}

# Run the function to start Appium
start_appium
