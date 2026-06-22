#!/usr/bin/env bash

# This script displays a random background on i3 startup

WALLPAPER_DIR="${WALLPAPER_DIR:-$HOME/Wallpapers}"

if [ "$#" -eq 0 ]; then
    file=$(find "$WALLPAPER_DIR" \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" \) -type f | shuf -n1 )
    exec feh --no-fehbg --bg-scale $file
fi
