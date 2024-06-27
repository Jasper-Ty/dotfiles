#!/usr/bin/env bash

source $DOTFILES/scripts/helpers.sh

readonly UTILITIES=(
    "felix"
    "ripgrep"
    "lsd"
    "bat"
    "bottom"
    "zellij"
    "starship"
)

if command -v &>/dev/null "rustup"
then
    cecho "GREEN" "rustup is installed\n"

    cecho "PURPLE" "Updating Rust toolchain\n"
    rustup self update
    rustup update

else
    cecho "RED" "rustup is not installed-- running installer\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
        | sh -s -- --default-toolchain stable --profile default --no-modify-path
fi

cecho "PURPLE" "Installing utilities\n"
for program in "${UTILITIES[@]}"
do
    cargo install $program
done
