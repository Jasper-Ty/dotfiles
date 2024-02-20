#!/usr/bin/env bash
source $DOTFILES/scripts/helpers.sh

mkdir -p "$HOME/.config/nvim"
symlink "nvim/init.lua" "$HOME/.config/nvim/init.lua"
symlink "nvim/lua" "$HOME/.config/nvim/lua"
