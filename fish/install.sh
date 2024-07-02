#!/bin/sh
echo $DOTFILES

. $DOTFILES/scripts/helpers.sh

cecho "GREEN" "hello!\n"

mkdir -p "$HOME/.config/fish/themes"

symlink "fish/config.fish" "$HOME/.config/fish/config.fish"
symlink "fish/themes/TokyoNight.theme" "$HOME/.config/fish/themes/TokyoNight.theme"
