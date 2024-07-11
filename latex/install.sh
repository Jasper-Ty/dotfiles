#!/bin/sh
. $DOTFILES/scripts/helpers.sh

TEXMFHOME=$( kpsewhich -var-value=TEXMFHOME )

# install jaspercommon.sty
mkdir -p "$TEXMFHOME/tex/latex/jaspercommon"
symlink "latex/jaspercommon.sty" "$TEXMFHOME/tex/latex/jaspercommon/jaspercommon.sty"
symlink "latex/proofcat.sty" "$TEXMFHOME/tex/latex/jaspercommon/proofcat.sty"
texhash $TEXMFHOME

# install .latexmkrc
symlink "latex/proofcat.sty" "$HOME/.latexmkrc"
