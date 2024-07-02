#!/bin/sh
echo $DOTFILES

. $DOTFILES/scripts/helpers.sh

cecho "GREEN" "hello!\n"

symlink "fish/config.fish" "$HOME/.config/fish/config.fish"
