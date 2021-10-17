echo -e "${BLUE}${BOLD}Configurando OEM Install:"
echo -e "${BLUE}${BOLD}=========================${RESET}"
echo -e "${BLUE}Baixando ISO Kubuntu${RESET}"
cd Downloads/
wget "https://cdimage.ubuntu.com/kubuntu/releases/20.04.3/release/kubuntu-20.04.3-desktop-amd64.iso"
sudo mv kubuntu-20.04.3-desktop-amd64.iso /boot/grml/
cd ..
echo