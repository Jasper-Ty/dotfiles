#!/usr/bin/env bash

source $DOTFILES/scripts/colors.sh

function log_error {
    local MSG=$1
    ERRORS=("${ERRORS[@]}" "$MSG")
}

function report_errors {
    if [ "${#ERRORS[@]}" -ne 0 ]
    then
        cecho "RED" "Found errors!\n"
        for ERROR in "${ERRORS[@]}"
        do
            cecho "RED" "   $ERROR\n"
        done
    else
        cecho "GREEN" "No errors!\n"
    fi
}

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
        log_error "Symlink failure: $SOURCE_FILE -> $TARGET_FILE" 1>&2
    fi
}

alias hascommand='command -v &>/dev/null'

function aliasif {
    local CMD=$2
    local ALIAS=$1
    hascommand $CMD && alias $ALIAS=$CMD
}
