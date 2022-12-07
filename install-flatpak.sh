#!/bin/bash

while read line
do
	echo -e "${BLUE}Instalando $line:${RESET}"
	flatpak install flathub -y $line
done < "Apps flatpak.txt"