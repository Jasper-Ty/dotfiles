#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh

install_packages curl build-essential

LIST="x"

for ITEM in $LIST
do
    echo "........installing $ITEM........"
    source "$DOTFILES/$ITEM/install.sh"
done

echo "DONE!"
