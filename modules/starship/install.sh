#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

cargo install starship --locked

symlink "$MODULE/starship.toml" "$HOME/.config/starship.toml"
symlink "$MODULE/greyed.toml" "$HOME/.config/greyed.toml"
