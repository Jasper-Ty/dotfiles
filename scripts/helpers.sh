#!/usr/bin/env bash

# Get dotfiles dir 
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi

source $DOTFILES/scripts/colors.sh

log_error() {
    echo $1 | tee -a /tmp/dotfiles_install_errors >&2
}

report_errors() {
    if [ -f /tmp/dotfiles_install_errors ]
    then
        cecho "RED" "Found errors!\n"
        printf "\033[0;31m"
        cat /tmp/dotfiles_install_errors
        printf "\033[0m"
    else
        cecho "GREEN" "No errors!\n"
    fi
}

install_package() {
    local PKG=$1
    dpkg-query -s $PKG >/dev/null 2>&1
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

    rm -rf $TARGET_FILE >/dev/null 2>&1

    ln -sfv "$SOURCE_FILE" "$TARGET_FILE" 
    if [ $? -ne 0 ]; then
        log_error "Symlink failure: $SOURCE_FILE -> $TARGET_FILE" 1>&2
    fi
}

aliasif() {
    local CMD=$2
    local ALIAS=$1
    command -v "$CMD" &>/dev/null && alias $ALIAS=$CMD
}
