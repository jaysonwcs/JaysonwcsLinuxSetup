#!/bin/bash

#./8b-get-dotfiles.sh /

gh auth login

cd "$1"
git clone https://github.com/jaysonwcs/dotfiles.git --recursive
mv dotfiles .dotfiles
