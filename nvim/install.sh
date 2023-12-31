#!/usr/bin/env bash

ln -sfv $(realpath "./init.lua") "/home/$USER/.config/nvim/init.lua"
ln -sfv $(realpath "./lua") "/home/$USER/.config/nvim/lua"
