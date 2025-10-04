#!/usr/bin/env bash

# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh


if command -v "fish" &>/dev/null
then
    cecho "GREEN" "fish is installed\n"
else
    # Add repository
    echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/4/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:4.list
    # Trust repository
    curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:4/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_4.gpg > /dev/null

    install_package fish
fi

# Set terminal to fish
echo "Changing login shell to fish..."
chsh -s /usr/bin/fish "$USER"

# Symlink themes
mkdir -p "$HOME/.config/fish/themes"
symlink "$DOTFILES/fish/config.fish" "$HOME/.config/fish/config.fish"
symlink "$DOTFILES/fish/themes/TokyoNight.theme" "$HOME/.config/fish/themes/TokyoNight.theme"
