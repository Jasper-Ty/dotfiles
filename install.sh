#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
source $DOTFILES/scripts/helpers.sh

echo "Installing cowsay and lolcat (IMPORTANT)..."
install_packages cowsay lolcat > /dev/null

if [ "$#" -eq 0 ]; then
    lolcow "... installing rust ..."
    fence
    if command -v "rustup" &>/dev/null
    then
        echo "rustup is installed"
        echo "updating rust toolchain..."
        rustup self update
        rustup update
    else
        echo "rustup is not installed"
        echo "installing rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
            | sh -s -- --default-toolchain stable --profile default --no-modify-path
        . "$HOME/.cargo/env"
    fi
    fence

    for installer in $DOTFILES/modules/*/install.sh; do
        dir=$(dirname $installer)
        name=$(basename $dir)

        lolcow "... installing $name ..."
        fence

        pushd $dir
        source $installer
        popd

        fence
    done

    install_packages curl git build-essential
    install_packages firefox-esr keepassxc
    install_packages libreoffice

else
    for module in $@; do
        installer="$DOTFILES/modules/$module/install.sh"

        if [ -x $installer ]; then
            lolcow "... installing $module ..."
            fence

            source $installer

            fence
        else
            lolcow "could'nt find $module"
        fi
    done
fi
echo


symlink "$DOTFILES/install.sh" "$HOME/.local/bin/dotfiles_install.sh"
