#!/bin/bash
# Name: Transfer Takeout Music
# Author: Nathan Duckett
# Description:
# Search through the corresponding files for google play music
# and youtube music to transfer into a shared folder

set +x

PATH_PREFIX="extracted"
TARGET_PREFIX="downloaded_music"

mkdir -p "$TARGET_PREFIX/gp-music"
mkdir -p "$TARGET_PREFIX/youtube-music"

# Search through each takeout_folder
for takeout_folder in "$PATH_PREFIX"/*; do
    # Copy Google Play Music - Check directory exists first
    GOOGLE_MUSIC_PATH="$takeout_folder/Takeout/Google Play Music/Tracks"
    if [[ -d "$GOOGLE_MUSIC_PATH" ]]; then
        for song in "$GOOGLE_MUSIC_PATH"/*.mp3; do
            cp "$song" "$TARGET_PREFIX/gp-music/"
        done
    fi

    # Copy Youtube Music - Check directory exists first
    YOUTUBE_MUSIC_PATH="$takeout_folder/Takeout/YouTube and YouTube Music/music-uploads"
    if [[ -d "$YOUTUBE_MUSIC_PATH" ]]; then
        for song in "$YOUTUBE_MUSIC_PATH"/*.mp3; do
            cp "$song" "$TARGET_PREFIX/youtube-music/"
        done
    fi
    echo "Finished processing ${takeout_folder##*/}"
done