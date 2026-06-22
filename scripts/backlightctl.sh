#!/usr/bin/env bash

# Basic backlight brightness control tool.

card="/sys/class/backlight/amdgpu_bl0"
if ! [ -d "$card" ] 
then
    echo "Cannot find backlight device"
    exit
fi

brightness="$card/brightness"
if ! [ -w "$brightness" ] 
then
    echo "Do not have permissions to change brightness."
    exit
fi

cur=$( cat "$cur/brightness" )
max=$( cat "$max/max_brightness" )

verb=$1
amt=$2

if [ "$verb" = "set" ]
then
    if [ $amt -le $max ] && [ $amt -ge 0 ]
    then
        echo $amt > "$brightness"
    else
        echo "Invalid brightness level."
    fi
    exit
fi 

if [ "$verb" = "up" ]
then
    res=$( expr $cur + $amt )

    if [ $res -le 0 ]
    then
        RES=0
    fi
    if [ $res -ge $max ]
    then
        res=$max
    fi
    echo $res > "$brightness"
    exit
fi

if [ "$verb" = "down" ]
then
    res=$( expr $cur - $amt )

    if [ $res -le 0 ]
    then
        res=0
    fi
    if [ $res -ge $max ]
    then
        res=max$
    fi
    echo $res > "$brightness"
    exit
fi

echo "USAGE: $0 set/up/down AMOUNT"
