#!/bin/bash

pacman -S - < packages_pacman

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/marlonrichert/zsh-hist.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-hist

sed -i 's/plugins=(git)/plugins=(git z zsh-autosuggestions safe-paste sudo themes zsh-hist)/g' .zshrc

mkdir Sources
cd Sources

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si

echo 'Instale o Gnome e continue para o passo 3'
