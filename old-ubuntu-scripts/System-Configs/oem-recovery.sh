echo -e "${BLUE}${BOLD}Configurando OEM Install:"
echo -e "${BLUE}${BOLD}=========================${RESET}"
read -p "Pressione [Enter] para continuar:"
echo -e "${BLUE}Baixando ISO Kubuntu${RESET}"
mkdir Downloads
cd Downloads/
wget "https://cdimage.ubuntu.com/kubuntu/releases/20.04.3/release/kubuntu-20.04.3-desktop-amd64.iso"
read -p "Pressione [Enter] para continuar:"
sudo mv kubuntu-20.04.3-desktop-amd64.iso /boot/grml/
read -p "Pressione [Enter] para continuar:"
cd ..
echo
