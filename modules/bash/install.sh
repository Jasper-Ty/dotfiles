#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

symlink "$MODULE/bashrc" "$HOME/.bashrc"
symlink "$MODULE/bash_profile" "$HOME/.bash_profile"
