#!/usr/bin/env bash

source $DOTFILES/scripts/helpers.sh

function printinstalled {
    local CMD=$1

    if hascommand "$CMD"; then
        local VER=$($CMD --version 2>/dev/null | head -n 1)
        cecho "GREEN"   "   ✅  $CMD "
        cecho "BLUE"    "$VER\n"
    else
        cecho "RED"     "   ❌  $CMD\n"
    fi
}

FONTS=(
    "Mononoki"
)
COMMANDLINETOOLS=(
    "fx"
    "rg"
    "lsd"
    "bat"
    "btm"
    "zellij"
    "starship"
)
RUSTCMDS=(
    "rustup"
    "cargo"
    "rustc"
)
CCMDS=(
    "gcc"
    "cmake"
)
PYCMDS=(
    "python"
    "python3"
    "pip"
    "pip3"
)
MATHCMDS=(
    "sage"
    "pdftex"
)
OTHER=(
    "make"
    "git"
    "nvim"
    "keepassxc"
)

function dotfiles {
    local CMD=$1

    if [ "$CMD" = "checkinstalled" ]; then
        cecho "PURPLE" "  FONTS\n"
        for FONT in "${FONTS[@]}"
        do
            FCLIST=$(fc-list | grep $FONT)
            if [[ $FCLIST ]] 
            then
                cecho "GREEN"   "   ✅  $FONT\n"
                echo "$FCLIST" | while read LINE 
                do
                    F=$(echo "$LINE" | awk -F ':' '{print $2,"("$3")"}')
                    cecho "BLUE" "      $F\n"
                done
            else
                cecho "RED"     "   ❌  $FONT\n"
            fi
        done

        cecho "PURPLE" "  COMMAND LINE TOOLS\n"
        for PROGRAM in "${COMMANDLINETOOLS[@]}"
        do
            printinstalled $PROGRAM 
        done

        cecho "PURPLE" "  RUST\n"
        for PROGRAM in "${RUSTCMDS[@]}"
        do
            printinstalled $PROGRAM 
        done

        cecho "PURPLE" "󰙱  C\n"
        for PROGRAM in "${CCMDS[@]}"
        do
            printinstalled $PROGRAM 
        done

        cecho "PURPLE" "󰌠  PYTHON\n"
        for PROGRAM in "${PYCMDS[@]}"
        do
            printinstalled $PROGRAM 
        done

        cecho "PURPLE" "󰿈  MATH\n"
        for PROGRAM in "${MATHCMDS[@]}"
        do
            printinstalled $PROGRAM 
        done

        cecho "PURPLE" "   OTHER\n"
        for PROGRAM in "${OTHER[@]}"
        do
            printinstalled $PROGRAM 
        done
    else
        echo "Command $CMD not found."
    fi
}
