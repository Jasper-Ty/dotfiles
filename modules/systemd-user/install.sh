#!/usr/bin/env bash

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
source $DOTFILES/scripts/helpers.sh
MODULE="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$XDG_CONFIG_HOME/systemd/user"

symlink "$MODULE/ssh-agent.service" "$XDG_CONFIG_HOME/systemd/user/ssh-agent.service"

systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service
