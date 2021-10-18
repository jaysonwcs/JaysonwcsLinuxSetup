echo -e "${BLUE}Instalando Driver Wifi${RESET}"
read -p "Pressione [Enter] para continuar:"
cd Sources/
git clone https://github.com/brektrou/rtl8821CU.git
cd rtl8821CU/
read -p "Pressione [Enter] para continuar:"
make
read -p "Pressione [Enter] para continuar:"
sudo make install
cd ..
read -p "Pressione [Enter] para continuar:"
rm -rf rtl8821CU/
cd ..
echo
