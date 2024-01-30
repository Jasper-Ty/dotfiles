#!/usr/bin/env bash
source $DOTFILES/scripts/helpers.sh

make
symlink "i3/config" "$HOME/.config/i3/config"
