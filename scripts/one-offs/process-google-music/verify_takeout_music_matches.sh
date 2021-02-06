#!/bin/bash
# Name: Verify Takeout Music Matches
# Author: Nathan Duckett
# Description:
# One liner to compare the difference between the google-play and youtube music
# libraries to verify any differences before copying.

PATH_PREFIX="downloaded_music"

diff -r "$PATH_PREFIX/gp-music" "$PATH_PREFIX/youtube-music"