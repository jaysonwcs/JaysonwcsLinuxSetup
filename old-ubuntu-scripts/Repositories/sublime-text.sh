echo -e "${BLUE}Adicionando repositório Sublime Text${RESET}"
read -p "Pressione [Enter] para continuar:"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
read -p "Pressione [Enter] para continuar:"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
read -p "Pressione [Enter] para continuar:"
echo
