#!/bin/bash

# Define colors for output
BL='\033[0;34m'
G='\033[0;32m'
RED='\033[0;31m'
YE='\033[1;33m'
NC='\033[0m' # No Color

#======================#
# Appium Configuration #
#======================#
APPIUM_PORT="${APPIUM_PORT:-4723}"  
KEEP_ALIVE="${KEEP_ALIVE:-600}"
#==============#
# Start Appium #
#==============#
printf "${G}==> ${BL}Starting Appium on port ${YE}${APPIUM_PORT}${G} with keep-alive ${YE}${KEEP_ALIVE}${G} ms <==${NC}\n"

# Check if KEEP_ALIVE is passed as an environment variable during docker run
if [ -z "$KEEP_ALIVE" ]; then
    # If KEEP_ALIVE is not passed, run without the --ka option
    if ! appium server --use-plugins=device-farm --plugin-device-farm-platform=android -p "${APPIUM_PORT}" -pa /wd/hub; then
        printf "${RED}Error: Failed to start Appium server.${NC}\n"
        exit 1
    fi
else
    # If KEEP_ALIVE is passed, include it in the command
    if ! appium server --ka "${KEEP_ALIVE}" --use-plugins=device-farm --plugin-device-farm-platform=android -p "${APPIUM_PORT}" -pa /wd/hub; then
        printf "${RED}Error: Failed to start Appium server.${NC}\n"
        exit 1
    fi
fi