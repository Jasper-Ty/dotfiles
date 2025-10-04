#!/usr/bin/env bash

# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh

install_package i3
install_package feh
install_package maim
install_package xclip
install_package picom
install_package pulseaudio
install_package dex
install_package xss-lock
install_package imagemagick
install_package network-manager

# Set up symlinks
mkdir -p "$HOME/.config/i3"
symlink "$DOTFILES/i3/config" "$HOME/.config/i3/config"
symlink "$DOTFILES/i3/.xinitrc" "$HOME/.xinitrc"
