#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE_DIR="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
MODULE_NAME=$(basename $MODULE)

install_packages brightnessctl

mkdir -p "$HOME/.config/i3/conf.d"
symlink "$MODULE_DIR/i3.conf" "$HOME/.config/i3/conf.d/$MODULE_NAME.conf"
symlink "$MODULE_DIR/polybar.ini" "$HOME/.config/polybar/conf.d/$MODULE_NAME.ini"
