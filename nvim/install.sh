#!/usr/bin/env bash

# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh

mkdir -p "$HOME/.config/nvim"
symlink "$DOTFILES/nvim/init.lua" "$HOME/.config/nvim/init.lua"
symlink "$DOTFILES/nvim/lua" "$HOME/.config/nvim/lua"
