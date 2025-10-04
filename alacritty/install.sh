#!/usr/bin/env bash

# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh

if command -v "alacritty" >&/dev/null
then
    cecho "GREEN" "Alacritty is installed\n"
else
    # Dependencies; see INSTALL.md in the Alacritty source tree
    DEPS="cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3"

    for DEP in $DEPS
    do
        install_package $DEP
    done

    # Install alacritty, if Rust is installed
    if command -v "rustup" >/dev/null 2>&1
    then
        cargo install alacritty
    else
        log_error "alacritty: Rust is not installed"
        exit
    fi
fi

# Copy configs
mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/alacritty/themes"
symlink "$DOTFILES/alacritty/alacritty.toml"          "$HOME/.config/alacritty/alacritty.toml"
symlink "$DOTFILES/alacritty/themes/tokyo-night.toml" "$HOME/.config/alacritty/themes/tokyo-night.toml"
