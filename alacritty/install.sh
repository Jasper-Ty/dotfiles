#!/usr/bin/env bash
source $DOTFILES/scripts/helpers.sh

mkdir -p "$HOME/.config/alacritty"

symlink "alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
symlink "alacritty/themes" "$HOME/.config/alacritty/themes"
