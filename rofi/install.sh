#!/usr/bin/env bash

# Get dotfiles dir 
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh

install_package rofi

mkdir -p "$HOME/.config/rofi"
symlink "$DOTFILES/rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
symlink "$DOTFILES/rofi/simple-tokyonight.rasi" "$HOME/.config/rofi/simple-tokyonight.rasi"
