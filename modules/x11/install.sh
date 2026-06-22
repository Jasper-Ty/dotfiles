#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

install_packages_txt $MODULE/packages.txt

symlink "$MODULE/xinitrc" "$HOME/.xinitrc"
