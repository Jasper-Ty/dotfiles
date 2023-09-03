#!/usr/bin/env bash

# Basic backlight brightness control tool.


CARD="/sys/class/backlight/amdgpu_bl0"
if ! [[ -d "$CARD" ]] 
then
    echo "Cannot find backlight device"
    exit
fi


BRIGHTNESS="$CARD/brightness"
if ! [[ -w "$BRIGHTNESS" ]] 
then
    echo "Do not have permissions to change brightness."
    exit
fi

CUR=$( cat "$CARD/brightness" )
MAX=$( cat "$CARD/max_brightness" )

VERB=$1
AMT=$2

if [[ $VERB = "set" ]]
then
    if [[ $AMT -le $MAX ]] && [[ $AMT -ge 0 ]]
    then
        echo $AMT > "$BRIGHTNESS"
    else
        echo "Invalid brightness level."
    fi
    exit
fi 

if [[ $VERB = "up" ]]
then
    RES=$( expr $CUR + $AMT )

    echo $CUR
    echo $RES
    echo $AMT

    if [[ $RES -le 0 ]]
    then
        RES=0
    fi
    if [[ $RES -ge $MAX ]]
    then
        RES=$MAX
    fi
    echo $RES > "$BRIGHTNESS"
    exit
fi

if [[ $VERB = "down" ]]
then
    let "RES = $CUR - $AMT"
    if [[ $RES -le 0 ]]
    then
        RES=0
    fi
    if [[ $RES -ge $MAX ]]
    then
        RES=$MAX
    fi
    echo $RES > "$BRIGHTNESS"
    exit
fi


echo "USAGE: $0 set/up/down amount"
