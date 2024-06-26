#!/usr/bin/env bash
source $DOTFILES/scripts/helpers.sh

symlink "bash/.bashrc" "$HOME/.bashrc"
symlink "bash/.bash_profile" "$HOME/.bash_profile"
