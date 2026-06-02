#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}$"

# Done
cd $HOME
exec i3
