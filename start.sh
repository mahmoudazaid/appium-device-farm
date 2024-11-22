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
BASE_PATH="${BASE_PATH:-}" # Default to empty string

#==============#
# Start Appium #
#==============#
printf "${G}==> ${BL}Starting Appium on port ${YE}${APPIUM_PORT}${G} with keep-alive ${YE}${KEEP_ALIVE}${G} ms <==${NC}\n"
if ! appium server -ka "${KEEP_ALIVE}" --use-plugins=device-farm --plugin-device-farm-platform=android -p "${APPIUM_PORT}" -pa $BASE_PATH; then
    printf "${RED}Error: Failed to start Appium server.${NC}\n"
    exit 1
fi