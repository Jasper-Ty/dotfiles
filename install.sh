#/usr/bin/env bash

# Get dotfiles dir 
export DOTFILES
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DOTFILES/scripts/helpers.sh
source $DOTFILES/scripts/colors.sh

ITEMS=(
    "rust"
    "alacritty"
    "bash"
    "i3"
    "latex"
    "nvim"
    "polybar"
    "rofi"
    "sage"
)

if [ "$#" -eq 0 ] 
then
    cecho "PURPLE" "INSTALLING EVERYTHING\n"
    for item in "${ITEMS[@]}"
    do
        installer="$item/install.sh"
        if [ -e $installer ]
        then
            cecho "BLUE" "Installing "
            cecho "GREEN" "$item\n"
            source $installer
        else
            cecho "RED" "install.sh not found for "
            cecho "GREEN" "$item\n"
        fi
    done
else
    for item in $@
    do
        installer="$item/install.sh"
        if [ -e $installer ]
        then
            cecho "BLUE" "Installing "
            cecho "GREEN" "$item\n"
            source $installer
        else
            cecho "RED" "install.sh not found for $item"
        fi
    done
fi

cecho "PURPLE" "Done!\n"

report_errors
