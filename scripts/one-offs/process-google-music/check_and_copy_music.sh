#!/bin/bash
# Name: Check and Copy Music
# Author: Nathan Duckett
# Description:
# Search through the corresponding Youtube Music folder, check if each
# song exists on the remote server, and if not copy it based on the artist-album

set -x

PATH_PREFIX="downloaded_music/youtube-music"
TARGET_SERVER="anton"
TARGET_SERVER_PATH_PREFIX="/mnt/mini/Music"
ALT_SERVER_PATH_PREFIX="/mnt/mini/music"

ssh $TARGET_SERVER "mkdir -p $TARGET_SERVER_PATH_PREFIX/extracted-music-to-sort/"

for song in "$PATH_PREFIX"/*.mp3; do
    # Strip just the song name
    song_name=${song##*/}
    song_name=${song_name%.mp3}
    # Check exists on server
    exists=$(ssh $TARGET_SERVER "find \"$TARGET_SERVER_PATH_PREFIX\" -path \"*$song_name*\"")
    if [[ ! $exists ]]; then
        scp "$song" "$TARGET_SERVER":"$TARGET_SERVER_PATH_PREFIX/extracted-music-to-sort/\"$song_name\".mp3"
    fi
done