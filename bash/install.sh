#!/usr/bin/env bash

# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh

symlink "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
symlink "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"
