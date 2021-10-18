echo -e "${BLUE}Adicionando repositório Plex Media Server${RESET}"
read -p "Pressione [Enter] para continuar:"
sudo touch /etc/apt/sources.list.d/plexmediaserver.list
read -p "Pressione [Enter] para continuar:"
echo "deb https://downloads.plex.tv/repo/deb/ public main" | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
read -p "Pressione [Enter] para continuar:"
wget -q https://downloads.plex.tv/plex-keys/PlexSign.key -O - | sudo apt-key add -
read -p "Pressione [Enter] para continuar:"
echo
