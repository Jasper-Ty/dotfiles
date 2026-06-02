#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"

log_error() {
    echo $1 | tee -a /tmp/dotfiles_install_errors >&2
}

report_errors() {
    if [ -f /tmp/dotfiles_install_errors ]
    then
        echo "RED" "there were errors"
        cat /tmp/dotfiles_install_errors
    else
        echo "GREEN" "no errors!"
    fi
}

install_packages() {
    local pkg
    local status=0

    echo "installing $@ ..."
    if (($# == 0)); then
        log_error "install_packages called with no package names"
        return 1
    fi

    for pkg in "$@"; do
        if dpkg-query -s "$pkg" >/dev/null 2>&1; then
            echo "$pkg already installed"
            continue
        fi

        if ! sudo apt-get install -- "$pkg"; then
            log_error "failed to install $pkg"
            status=1
        fi
    done

    return "$status"
}

install_package() {
    local PKG=$1
    dpkg-query -s $PKG >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        sudo apt-get install $PKG
        if [ $? -ne 0 ]; then
            log_error "failed to install $PKG"
        fi
    else
        echo "$PKG already installed"
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
