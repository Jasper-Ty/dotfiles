#!/usr/bin/env bash

# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh

# I don't remember how this works
fonts_dir="$DOTFILES/fonts"
find_command="find \"$fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -I % cp "%" "$HOME/.fonts"

fc-cache -f "$HOME/.fonts"
