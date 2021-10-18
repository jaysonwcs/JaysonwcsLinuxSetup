echo -e "${BLUE}Adicionando repositório Snapper${RESET}"
read -p "Pressione [Enter] para continuar:"
echo 'deb http://download.opensuse.org/repositories/filesystems:/snapper/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/filesystems:snapper.list
read -p "Pressione [Enter] para continuar:"
curl -fsSL https://download.opensuse.org/repositories/filesystems:snapper/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/filesystems_snapper.gpg > /dev/null
read -p "Pressione [Enter] para continuar:"
echo
