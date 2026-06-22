#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.local/share/.fonts"
find "$MODULE" -name '*.[o,t]tf' -type f -print0 | xargs -0 cp --target-directory="$HOME/.local/share/fonts"
fc-cache -f -v
