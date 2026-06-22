#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config/nvim"
symlink "$MODULE/init.lua" "$HOME/.config/nvim/init.lua"
symlink "$MODULE/lua" "$HOME/.config/nvim/lua"
