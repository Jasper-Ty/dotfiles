#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh

install_packages xorg xinit dbus-x11
install_packages xterm

symlink "$DOTFILES/x/.xinitrc" "$HOME/.xinitrc"
