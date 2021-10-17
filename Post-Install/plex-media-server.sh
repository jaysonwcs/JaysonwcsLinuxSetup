echo -e "${BLUE}Configurando Plex Media Server${RESET}"
sudo setfacl -m u:plex:rx /media/jayson
sudo setfacl -m u:plex:rx /media/jayson/Arquivo_Backup
echo