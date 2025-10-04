#!/usr/bin/env bash

# Get dotfiles dir and load helper functions
if ! [[ -v DOTFILES ]]
then
    export DOTFILES
    DOTFILES="$(realpath "$(dirname "$(realpath "$0")")/..")"
fi
source $DOTFILES/scripts/helpers.sh

TEXMFHOME=$( kpsewhich -var-value=TEXMFHOME )

# install jaspercommon.sty
mkdir -p "$TEXMFHOME/tex/latex/jaspercommon"
symlink "$DOTFILES/latex/jaspercommon.sty" "$TEXMFHOME/tex/latex/jaspercommon/jaspercommon.sty"
symlink "$DOTFILES/latex/proofcat.sty" "$TEXMFHOME/tex/latex/jaspercommon/proofcat.sty"
texhash $TEXMFHOME

# install .latexmkrc
symlink "$DOTFILES/latex/.latexmkrc" "$HOME/.latexmkrc"
