#!/usr/bin/env bash

make
ln -sfv $(realpath "./config") "/home/$USER/.config/i3/config"
