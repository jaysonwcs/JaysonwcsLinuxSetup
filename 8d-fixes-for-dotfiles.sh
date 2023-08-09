#!/bin/bash

mkdir -p ~/.local/share
mv ~/.oh-my-zsh ~/.local/share/oh-my-zsh

mkdir -p ~/.local/state/zsh
mv ~/.zsh_history ~/.local/state/zsh/history

mkdir -p ~/.config/zsh
mv ~/.zshrc ~/.config/zsh/.zshrc

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"