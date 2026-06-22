#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

install_packages_txt $MODULE/packages.txt

mkdir -p "$HOME/.config/rofi"
symlink "$MODULE/config.rasi" "$HOME/.config/rofi/config.rasi"
symlink "$MODULE/simple-tokyonight.rasi" "$HOME/.config/rofi/simple-tokyonight.rasi"
