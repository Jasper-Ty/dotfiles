#!/usr/bin/env bash

export DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
mkdir -p "$DOTFILES/logs"

# ===== Environment ===========================================================

# XDG
# See https://specifications.freedesktop.org/.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export BROWSER="firefox"
export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"

# locale
export LANG="en_US.UTF-8"

export PATH="$PATH:$HOME/.local/bin"

set -a
. "$DOTFILES/.env"
set +a


# ===== DBus ==================================================================

if command -v dbus-launch &>/dev/null 
then
    if ! [[ -v "$DBUS_SESSION_BUS_ADDRESS" ]]
    then
        eval "$(dbus-launch --sh-syntax --exit-with-session)"
        echo "DBus session started with PID $DBUS_SESSION_BUS_PID"
    fi
fi


# ===== Daemons ===============================================================

dunst &
lxpolkit &
nm-applet &

# Done
cd $HOME
exec i3
