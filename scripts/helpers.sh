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
    local status=0

    echo "installing $@ ..."
    if (($# == 0)); then
        log_error "install_packages called with no package names"
        return 1
    fi

    local pkg
    for pkg in "$@"; do
        if dpkg-query -s "$pkg" >/dev/null 2>&1; then
            echo "$pkg already installed"
            continue
        fi

        if ! sudo apt install -y -- "$pkg"; then
            log_error "failed to install $pkg"
            status=1
        fi
    done

    return "$status"
}

install_packages_txt() {
    local pkg_file="${1:-packages.txt}"
    local status=0

    echo "installing from $pkg_file ..."
    if [ ! -r $pkg_file ]; then
        log_error "install_packages_txt called with nonexistent file"
        return 1
    fi

    local packages
    readarray -t packages < $pkg_file
    install_packages "${packages[@]}"
}

symlink() {
    local src=$1
    local tgt=$2

    rm -rf $tgt >/dev/null 2>&1

    ln -sfv "$src" "$tgt" 
    if [ $? -ne 0 ]; then
        log_error "Symlink failure: $src -> $tgt" 1>&2
    fi
}

fence() {
    printf %"$COLUMNS"s |tr " " "-" | lolcat
}

lolcow() {
    echo "$1" | cowsay | lolcat
}

aliasif() {
    local CMD=$2
    local ALIAS=$1
    command -v "$CMD" &>/dev/null && alias $ALIAS=$CMD
}
