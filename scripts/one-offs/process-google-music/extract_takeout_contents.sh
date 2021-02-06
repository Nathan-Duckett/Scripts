#!/bin/bash
# Name: Extract Takeout Contents
# Author: Nathan Duckett
# Description:
# Extract all zip files within PATH_PREFIX out into directories
# with the same name in the TARGET_PREFIX

set +x

PATH_PREFIX="raw"
TARGET_PREFIX="extracted"

# Check the unzip command exists on the system
if ! command -v unzip; then
    sudo apt install unzip -y
fi

# Create target directory for output
mkdir $TARGET_PREFIX

# Loop every zip file in the prefix
for takeout_folder in "$PATH_PREFIX"/*.zip; do
    # Extract the name without .zip at the end
    name=${takeout_folder%.zip}
    # Extract the name with any path prefixes in front removed
    # e.g. sub/file becomes file
    folder_name=${name##*/}
    unzip "$takeout_folder" -d "$TARGET_PREFIX/$folder_name"
done