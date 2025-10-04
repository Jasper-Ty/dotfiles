#!/usr/bin/env bash

# This script displays a background on i3 startup

source "$DOTFILES/.env"

if [ -v JDE_WALLPAPER_FILE ]
then
    echo "WALLPAPER_FILE"
    exec feh --bg-scale $JDE_WALLPAPER_FILE
elif [ -v JDE_WALLPAPER_DIR ]
then
    echo "WALLPAPER_DIR"
    exec feh --bg-scale $(find "$JDE_WALLPAPER_DIR" | shuf -n1)
fi
