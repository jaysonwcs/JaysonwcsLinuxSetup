#!/bin/bash

mkdir ~/Sources
cd ~/Sources
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
