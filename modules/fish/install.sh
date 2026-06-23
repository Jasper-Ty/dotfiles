#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if command -v "fish" &>/dev/null
then
    echo "fish is installed"
else
    # Add repository
    echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/4/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:4.list
    # Trust repository
    curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:4/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_4.gpg > /dev/null
    install_packages fish
fi

# Set terminal to fish
if [ $SHELL = $(which fish) ]; then
    echo "fish is already login shell"
else
    echo "Changing login shell to fish..."
    chsh -s /usr/bin/fish "$USER"
fi

# Symlink themes
mkdir -p "$HOME/.config/fish/themes"
symlink "$MODULE/themes/TokyoNight.theme" "$HOME/.config/fish/themes/TokyoNight.theme"

# Config files
symlink "$MODULE/config.fish" "$HOME/.config/fish/config.fish"

CONF_DIR="$HOME/.config/fish/conf.d"
mkdir -p $CONF_DIR
for file in $MODULE/conf.d/*.ini; do
    symlink $file "$CONF_DIR/$(basename $file)"
done
