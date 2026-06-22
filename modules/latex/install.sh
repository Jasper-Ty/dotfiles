#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh
source $DOTFILES/scripts/helpers.sh

TEXMFHOME=$( kpsewhich -var-value=TEXMFHOME )

# install jaspercommon.sty
mkdir -p "$TEXMFHOME/tex/latex/jaspercommon"
symlink "$DOTFILES/latex/jaspercommon.sty" "$TEXMFHOME/tex/latex/jaspercommon/jaspercommon.sty"
symlink "$DOTFILES/latex/proofcat.sty" "$TEXMFHOME/tex/latex/jaspercommon/proofcat.sty"
texhash $TEXMFHOME

# install .latexmkrc
symlink "$DOTFILES/latex/.latexmkrc" "$HOME/.latexmkrc"
