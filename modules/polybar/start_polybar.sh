#!/usr/bin/env bash

LOG="/tmp/polybar.log"

# Terminate already running polybar instances
killall -q polybar

# Touch polybar log
echo "---" >> "$LOG"

# Main monitor 
export POLYBAR_MONITOR="$JDE_MAIN_MONITOR"
export POLYBAR_MODULES_LEFT="$JDE_BAR_MODULES_LEFT"
export POLYBAR_MODULES_RIGHT="$JDE_BAR_MODULES_RIGHT"
export POLYBAR_TRAY_POSITION=right
export POLYBAR_PADDING_RIGHT=2
polybar top >> "$LOG" 2>&1 & disown
polybar bottom >> "$LOG" 2>&1 & disown

echo "Bars launched..."
