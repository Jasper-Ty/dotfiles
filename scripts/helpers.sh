#!/usr/bin/env bash

function sourceif {
    if [ -f $1 ]; then
        source $1
    fi
}

function symlink {
    local SOURCE_FILE=$1
    local TARGET_FILE=$2

    SOURCE_FILE=$(realpath $DOTFILES/$SOURCE_FILE)
    rm -rf $TARGET_FILE 2>&1 > /dev/null

    ln -sfv "$SOURCE_FILE" "$TARGET_FILE"
    if [ $? -ne 0 ]; then
        echo "Symlink failure: $SOURCE_FILE -> $TARGET_FILE" 1>&2
    fi
}
