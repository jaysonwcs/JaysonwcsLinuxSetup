#!/bin/sh

git clone https://github.com/jaysonwcs/dotfiles.git --recursive
mv dotfiles .dotfiles
cd .dotfiles
./install-profile default
