#!/bin/sh

. $DOTFILES/scripts/colors.sh

log_error() {
    echo $1 > /tmp/dotfiles_install_errors
}

report_errors() {
    if [ -f /tmp/dotfiles_install_errors ]
    then
        cecho "RED" "Found errors!\n"
        echo "\033[0;31m"
        cat /tmp/dotfiles_install_errors
        echo "\033[0m"
    else
        cecho "GREEN" "No errors!\n"
    fi
}

install_package() {
    local PKG=$1
    dpkg-query -s $PKG > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        sudo apt-get install $PKG
        if [ $? -ne 0 ]; then
            log_error "Failed to install package: $PKG"
        fi
    else
        cecho "GREEN" "Already installed: $PKG\n"
        return
    fi
}

symlink() {
    local SOURCE_FILE=$1
    local TARGET_FILE=$2

    SOURCE_FILE=$( realpath $DOTFILES/$SOURCE_FILE )
    rm -rf $TARGET_FILE 2>&1 > /dev/null

    ln -sfv "$SOURCE_FILE" "$TARGET_FILE" 
    if [ $? -ne 0 ]; then
        log_error "Symlink failure: $SOURCE_FILE -> $TARGET_FILE" 1>&2
    fi
}

alias hascommand='command -v &>/dev/null'

aliasif() {
    local CMD=$2
    local ALIAS=$1
    hascommand $CMD && alias $ALIAS=$CMD
}
