#!/usr/bin/env bash

source "$DOTFILES/.env"

CONFIG="$DOTFILES/polybar/config.ini"
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
polybar --config="$CONFIG" top >> "$LOG" 2>&1 & disown
polybar --config="$CONFIG" bottom >> "$LOG" 2>&1 & disown

# Other monitor 
if [[ -v JDE_SIDE_MONITOR ]]
then
    export POLYBAR_MONITOR="$JDE_SIDE_MONITOR"
    export POLYBAR_TRAY_POSITION=none
    export POLYBAR_PADDING_RIGHT=4 # padding because no tray
    polybar --config="$CONFIG" top >> "$LOG" 2>&1 & disown
fi

echo "Bars launched..."
