#!/usr/bin/env bash
source $DOTFILES/scripts/helpers.sh

mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/alacritty/themes"

symlink "alacritty/alacritty.toml"          "$HOME/.config/alacritty/alacritty.toml"
symlink "alacritty/themes/tokyo-night.toml" "$HOME/.config/alacritty/themes/tokyo-night.toml"
