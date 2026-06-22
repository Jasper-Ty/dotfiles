#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

install_packages pulseaudio

mkdir -p "$HOME/.config/i3/conf.d"
symlink "$MODULE/i3.conf" "$HOME/.config/i3/conf.d/laptop-audio.conf"
