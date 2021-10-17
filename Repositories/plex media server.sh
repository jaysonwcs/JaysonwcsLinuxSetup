echo -e "${BLUE}Adicionando repositório Plex Media Server${RESET}"
sudo touch /etc/apt/sources.list.d/plexmediaserver.list
echo "deb https://downloads.plex.tv/repo/deb/ public main" | sudo tee /etc/apt/sources.list.d/plexmediaserver.listdeb https://downloads.plex.tv/repo/deb/ public main
wget -q https://downloads.plex.tv/plex-keys/PlexSign.key -O - | sudo apt-key add -
echo