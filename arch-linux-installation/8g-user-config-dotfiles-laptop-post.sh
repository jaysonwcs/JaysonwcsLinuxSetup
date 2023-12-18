#!/bin/sh

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

cd /.dotfiles
./install-profile home
