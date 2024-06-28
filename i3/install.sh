#!/usr/bin/env bash
source $DOTFILES/scripts/helpers.sh

install_package i3

make

mkdir -p "$HOME/.config/i3"
symlink "i3/config" "$HOME/.config/i3/config"
