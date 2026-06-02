#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh

install_package xorg 
install_package xinit 
install_package dbus-x11 

symlink "$DOTFILES/x/.xinitrc" "$HOME/.xinitrc"
