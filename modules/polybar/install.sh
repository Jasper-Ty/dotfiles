#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

install_packages polybar psmisc

mkdir -p "$HOME/.config/polybar"
symlink "$MODULE/config.ini" "$HOME/.config/polybar/config.ini"

CONF_DIR="$HOME/.config/polybar/conf.d"
mkdir -p $CONF_DIR
for file in $MODULE/conf.d/*.ini; do
    symlink $file "$CONF_DIR/$(basename $file)"
done

symlink "$MODULE/start_polybar.sh" "$HOME/.local/bin/start_polybar.sh"

mkdir -p "$HOME/.config/i3/conf.d"
symlink "$MODULE/i3.conf" "$HOME/.config/i3/conf.d/polybar.conf"
