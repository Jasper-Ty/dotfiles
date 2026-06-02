#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh

install_package curl
install_package build-essentials

LIST="x"

for ITEM in $LIST
do
    echo "........installing $ITEM........"
    source "$DOTFILES/$ITEM/install.sh"
done

echo "DONE!"
