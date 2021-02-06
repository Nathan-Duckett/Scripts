#!/bin/bash
# Name: Extract Takeout Contents
# Author: Nathan Duckett
# Description:
# Extract all zip files within PATH_PREFIX out into directories
# with the same name in the TARGET_PREFIX

set +x

PATH_PREFIX="raw"
TARGET_PREFIX="extracted"

if [[ -z unzip ]]; then
    sudo apt install unzip -y
fi

mkdir $TARGET_PREFIX

for takeout_folder in $PATH_PREFIX/*.zip; do
    name=${takeout_folder%.zip}
    folder_name=${name##*/}
    unzip "$takeout_folder" -d "$TARGET_PREFIX/$folder_name"
done