#!/bin/bash

pacman -S - < packages_gui
paru -S - < packages_aur
paru -c

while read line
do
        echo -e "Instalando $line:"
        flatpak install flathub -y $line
done < "packages_flatpak"
