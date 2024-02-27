#!/usr/bin/env bash

# Get dotfiles dir 
export DOTFILES
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles via git
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin main 
