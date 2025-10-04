#!/bin/sh

# lock-blur.sh
# This script runs whenever my laptop goes to sleep.

# take a screenshot
maim /tmp/lock_screen_screenshot.png

# blur
convert /tmp/lock_screen_screenshot.png -blur 0x8 /tmp/lock_screen_screenshot.png

# run i3lock with blurred screenshot as image
i3lock -u -e -n -i /tmp/lock_screen_screenshot.png

# delete screenshot after
rm /tmp/lock_screen_screenshot.png
