#!/bin/sh

can_color_output() {
    if [ -t 1 ] && [ $( tput colors ) -ge 8 ]
    then
        return 0
    else
        return 1
    fi
}

cecho() {
    local readonly BLACK="\033[0;30m"        # Black
    local readonly RED="\033[0;31m"          # Red
    local readonly GREEN="\033[0;32m"        # Green
    local readonly YELLOW="\033[0;33m"       # Yellow
    local readonly BLUE="\033[0;34m"         # Blue
    local readonly PURPLE="\033[0;35m"       # Purple
    local readonly CYAN="\033[0;36m"         # Cyan
    local readonly WHITE="\033[0;37m"        # White

    if can_color_output
    then
        echo $( eval echo \$$1 )
        echo "$2"
        echo "\033[0m"
    else
        echo "${2}"
    fi

}

colortest() {
    # ANSI color scheme script featuring Space Invaders
    #
    # Original: http://crunchbanglinux.org/forums/post/126921/#p126921
    # Modified by lolilolicon
    # Modified by Jasper Ty

    local f=3 
    local b=4
    for j in f b; do
        for i in {0..7}; do
            eval "local $j$i=$(printf %b "\e[${!j}${i}m")"
        done
    done
    bld=$'\e[1m'
    rst=$'\e[0m'

    cat << EOF

 $f1  ▀▄   ▄▀     $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4  ▀▄   ▄▀     $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $f1 ▄█▀███▀█▄    $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4 ▄█▀███▀█▄    $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $f1█▀███████▀█   $f2▀▀███▀▀███▀▀   $f3▀█▀██▀█▀   $f4█▀███████▀█   $f5▀▀███▀▀███▀▀   $f6▀█▀██▀█▀$rst
 $f1▀ ▀▄▄ ▄▄▀ ▀   $f2 ▀█▄ ▀▀ ▄█▀    $f3▀▄    ▄▀   $f4▀ ▀▄▄ ▄▄▀ ▀   $f5 ▀█▄ ▀▀ ▄█▀    $f6▀▄    ▄▀$rst

 $bld$f1▄ ▀▄   ▄▀ ▄   $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4▄ ▀▄   ▄▀ ▄   $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $bld$f1█▄█▀███▀█▄█   $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4█▄█▀███▀█▄█   $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $bld$f1▀█████████▀   $f2▀▀▀██▀▀██▀▀▀   $f3▀▀█▀▀█▀▀   $f4▀█████████▀   $f5▀▀▀██▀▀██▀▀▀   $f6▀▀█▀▀█▀▀$rst
 $bld$f1 ▄▀     ▀▄    $f2▄▄▀▀ ▀▀ ▀▀▄▄   $f3▄▀▄▀▀▄▀▄   $f4 ▄▀     ▀▄    $f5▄▄▀▀ ▀▀ ▀▀▄▄   $f6▄▀▄▀▀▄▀▄$rst


                                     $f7▌$rst

                                   $f7▌$rst

                              $f7    ▄█▄    $rst
                              $f7▄█████████▄$rst
                              $f7▀▀▀▀▀▀▀▀▀▀▀$rst

EOF
}
