!#/bin/bash

mkdir -p ~/.local/share
cp -r ~/.oh-my-zsh .local/share/oh-my-zsh

mkdir -p ~/.local/state/zsh
mv ~/.zsh_history ~/.local/state/zsh/history

mkdir -p ~/.config/zsh
mv ~/.zshrc ~/.config/zsh/.zshrc

