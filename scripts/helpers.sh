#!/usr/bin/env bash

source $DOTFILES/scripts/colors.sh

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

function hascommand { command -v $1 &> /dev/null; }

function install {
    local PACKAGE=$1
    if hascommand apt; then
        sudo apt install $1
    else
        echo "Does not have apt"
    fi
}

function printinstalled {
    local CMD=$1

    if hascommand "$CMD"; then
        echo -e "${GREEN}✅${COLOR_OFF} $CMD"
    else
        echo -e "${RED}❌${COLOR_OFF} $CMD"
    fi
}

declare -a PROGRAMS 
PROGRAMS=("lsd" "btm" "nvim" "zellij" "nvm" "opam" "gap" "sage" "cargo" "rustc" "rustup")

function dotfiles {
    local CMD=$1

    if [ "$CMD" = "checkinstalled" ]; then
        echo "Checking installed programs..."
        
        for PROGRAM in "${PROGRAMS[@]}"
        do
            printinstalled $PROGRAM 
        done
    else
        echo "Command $CMD not found."
    fi
}
