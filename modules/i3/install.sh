#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

install_packages_txt $MODULE/packages.txt

# Set up symlinks
mkdir -p "$HOME/.config/i3"
symlink "$MODULE/config" "$HOME/.config/i3/config"

CONF_DIR="$HOME/.config/i3/conf.d"
mkdir -p $CONF_DIR
for file in $MODULE/conf.d/*.conf; do
    symlink $file "$CONF_DIR/$(basename $file)"
done
