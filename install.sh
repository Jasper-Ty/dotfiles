#!/bin/sh

# Get dotfiles dir 
export DOTFILES
DOTFILES="$( cd "$( dirname "$0" )" && pwd )"

. $DOTFILES/scripts/helpers.sh

ITEMS="rust alacritty bash fish i3 latex nvim polybar rofi sage"

if [ "$#" -eq 0 ] 
then
    cecho "PURPLE" "INSTALLING EVERYTHING\n"
    for item in $ITEMS 
    do
        installer="$item/install.sh"
        if [ -f $installer ]
        then
            cecho "BLUE" "Installing "
            cecho "GREEN" "$item\n"
            . $installer
        else
            cecho "RED" "install.sh not found for "
            cecho "GREEN" "$item\n"
        fi
    done
else
    for item in $@
    do
        installer="$item/install.sh"
        if [ -f $installer ]
        then
            cecho "BLUE" "Installing "
            cecho "GREEN" "$item\n"
            . $installer
        else
            cecho "RED" "install.sh not found for $item"
        fi
    done
fi

cecho "PURPLE" "Done!\n"

report_errors

rm -rf /tmp/dotfiles_install_errors 2>&1 >/dev/null
