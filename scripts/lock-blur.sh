#!/usr/bin/env bash
scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x8 /tmp/screenshot.png
i3lock -u -e -n -i /tmp/screenshot.png
rm /tmp/screenshot.png
