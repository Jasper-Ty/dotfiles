#!/bin/sh
. $DOTFILES/scripts/helpers.sh

symlink "bash/.bashrc" "$HOME/.bashrc"
symlink "bash/.bash_profile" "$HOME/.bash_profile"
