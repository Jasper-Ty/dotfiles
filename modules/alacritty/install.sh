#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Dependencies; see INSTALL.md in the Alacritty source tree
install_packages cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install alacritty

mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/alacritty/themes"
symlink "$MODULE/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
symlink "$MODULE/themes/tokyo-night.toml" "$HOME/.config/alacritty/themes/tokyo-night.toml"
