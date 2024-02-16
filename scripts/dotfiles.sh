#!/usr/bin/env bash

source $DOTFILES/scripts/helpers.sh

function printinstalled {
    local CMD=$1

    if hascommand "$CMD"; then
        cecho "GREEN" "✅"
    else
        cecho "RED" "❌"
    fi
    cecho "PURPLE" " $CMD\n"
}

declare -a PROGRAMS 
PROGRAMS=("lsd" "bat" "btm" "nvim" "zellij" "nvm" "opam" "gap" "sage" "cargo" "rustc" "rustup")

function dotfiles {
    local CMD=$1

    if [ "$CMD" = "checkinstalled" ]; then
        cecho "BLUE" "Checking installed programs...\n"
        
        for PROGRAM in "${PROGRAMS[@]}"
        do
            printinstalled $PROGRAM 
        done
    else
        echo "Command $CMD not found."
    fi
}
