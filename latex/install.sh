#!/usr/bin/env bash
source $DOTFILES/scripts/helpers.sh

TEXMFHOME=$(kpsewhich -var-value=TEXMFHOME)

mkdir -p "$TEXMFHOME/tex/latex/jaspercommon"
symlink "latex/jaspercommon.sty" "$TEXMFHOME/tex/latex/jaspercommon/jaspercommon.sty"
texhash $TEXMFHOME
