echo -e "${BLUE}Configurando Plex Media Server${RESET}"
read -p "Pressione [Enter] para continuar:"
sudo setfacl -m u:plex:rx /media/jayson
sudo setfacl -m u:plex:rx /media/jayson/Arquivo_Backup
read -p "Pressione [Enter] para continuar:"
echo
