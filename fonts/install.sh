#!/bin/sh

. $DOTFILES/scripts/helpers.sh

fonts_dir=$( cd "$( dirname "$0" )" && pwd )

find_command="find \"$fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

eval $find_command | xargs -0 -I % cp "%" "$HOME/.fonts"

if command -v fc-cache > /dev/null;
then
    fc-cache -f "$HOME/.fonts"
fi
