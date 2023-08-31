#!/usr/bin/env bash

CONFIG="$HOME/.config/polybar/config.ini"
LOG_FILE="/tmp/polybar.log"

# Terminate already running polybar instances
killall -q polybar

# Touch polybar log
echo "---" >> "$LOG_FILE"

# Main monitor 
export POLYBAR_MONITOR=eDP
export POLYBAR_TRAY_POSITION=right
export POLYBAR_PADDING_RIGHT=2
polybar --config="$CONFIG" top >> "$LOG_FILE" 2>&1 & disown
polybar --config="$CONFIG" bottom >> "$LOG_FILE" 2>&1 & disown

# Other monitor 
export POLYBAR_MONITOR=HDMI-A-0
export POLYBAR_TRAY_POSITION=none
export POLYBAR_PADDING_RIGHT=4 # padding because no tray
polybar --config="$CONFIG" top >> /tmp/polybar.log 2>&1 & disown

echo "Bars launched..."
