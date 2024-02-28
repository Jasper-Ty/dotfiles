#/usr/bin/env bash

# Get dotfiles dir 
# Written by shack
export DOTFILES
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DOTFILES/scripts/helpers.sh
source $DOTFILES/scripts/colors.sh

if [ "$#" -eq 0 ] 
then
    cecho "PURPLE" "INSTALLING EVERYTHING\n"
else
    for item in $@
    do
        INSTALLER="$DOTFILES/$item/install.sh"
        if [ -e $INSTALLER ]
        then
            cecho "BLUE" "Installing configs for\n"
            cecho "GREEN" "    $item\n"
            source $INSTALLER
        else
            cecho "RED" "install.sh not found for $item"
        fi
    done
fi
