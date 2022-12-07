#!/bin/bash

while read line
do
	echo -e "Instalando $line:"
	flatpak install flathub -y $line
done < "packages_flatpak"