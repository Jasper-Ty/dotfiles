#!/usr/bin/env bash

source $DOTFILES/scripts/helpers.sh

if command -v > /dev/null "alacritty"
then
    cecho "GREEN" "Alacritty is installed\n"

    mkdir -p "$HOME/.config/alacritty"
    mkdir -p "$HOME/.config/alacritty/themes"

    symlink "alacritty/alacritty.toml"          "$HOME/.config/alacritty/alacritty.toml"
    symlink "alacritty/themes/tokyo-night.toml" "$HOME/.config/alacritty/themes/tokyo-night.toml"
else
    log_error "Alacritty is not installed"
fi
