#!/usr/bin/env bash
#
# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")")"
fi
source $DOTFILES/scripts/helpers.sh

LIST="rust alacritty i3 fish fonts polybar rofi starship"

for ITEM in $LIST
do
    cecho "GREEN" "........INSTALLING $ITEM........\n"
    source "./$ITEM/install.sh"
done

cecho "GREEN" "DONE!\n"
