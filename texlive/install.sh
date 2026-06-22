#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh

cd /tmp
curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-2*
sudo perl ./install-tl --no-interaction
