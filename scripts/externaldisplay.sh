#!/bin/sh

# Something is wrong with my udev setup-- disabling this script for now
exit

MAIN=eDP
OUTPUT=HDMI-A-0

export DISPLAY=:0

xrandr | grep "$OUTPUT connected"
if [ $? -eq 0 ]; then
    xrandr --output $OUTPUT --above $MAIN --auto
    notify-send 'Monitor plugged in'
else
    xrandr --output $OUTPUT --off
    notify-send 'Monitor unplugged'
fi
i3-msg restart
