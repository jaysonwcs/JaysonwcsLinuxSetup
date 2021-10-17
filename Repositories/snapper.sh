echo -e "${BLUE}Adicionando repositório Snapper"
echo 'deb http://download.opensuse.org/repositories/filesystems:/snapper/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/filesystems:snapper.list
curl -fsSL https://download.opensuse.org/repositories/filesystems:snapper/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/filesystems_snapper.gpg > /dev/null
echo