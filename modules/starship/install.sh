#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

cargo install starship --locked

mkdir -p "$HOME/.config/starship"

symlink "$MODULE/starship.toml" "$HOME/.config/starship/starship.toml"
symlink "$MODULE/greyed.toml" "$HOME/.config/starship/greyed.toml"
