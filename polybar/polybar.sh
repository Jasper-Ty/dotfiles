#!/usr/bin/env bash

CONFIG="/home/jasper/dotfiles/polybar/config.ini"
LOG="/tmp/polybar.log"

# Terminate already running polybar instances
killall -q polybar

# Touch polybar log
echo "---" >> "$LOG"

# Main monitor 
export POLYBAR_MONITOR=eDP
export POLYBAR_TRAY_POSITION=right
export POLYBAR_PADDING_RIGHT=2
polybar --config="$CONFIG" top >> "$LOG" 2>&1 & disown
polybar --config="$CONFIG" bottom >> "$LOG" 2>&1 & disown

# Other monitor 
export POLYBAR_MONITOR=HDMI-A-0
export POLYBAR_TRAY_POSITION=none
export POLYBAR_PADDING_RIGHT=4 # padding because no tray
polybar --config="$CONFIG" top >> /tmp/polybar.log 2>&1 & disown

echo "Bars launched..."
