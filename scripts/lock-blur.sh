#!/usr/bin/env bash

# take a screenshot
scrot /tmp/screenshot.png

# blur
convert /tmp/screenshot.png -blur 0x8 /tmp/screenshot.png

# run i3lock with blurred screenshot as image
i3lock -u -e -n -i /tmp/screenshot.png

# delete screenshot after
rm /tmp/screenshot.png
