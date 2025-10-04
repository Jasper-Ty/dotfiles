#!/usr/bin/env bash

# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh

if command -v "rustup" &>/dev/null
then
    # If rustup
    cecho "GREEN" "rustup is installed\n"

    cecho "PURPLE" "Updating Rust toolchain\n"
    rustup self update
    rustup update

else
    cecho "RED" "rustup is not installed-- running installer\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
        | sh -s -- --default-toolchain stable --profile default --no-modify-path
    . "$HOME/.cargo/env"
fi

UTILITIES="felix ripgrep lsd bat zellij starship"

cecho "PURPLE" "Installing utilities\n"
for program in $UTILITIES
do
    cargo install $UTILITIES
done
