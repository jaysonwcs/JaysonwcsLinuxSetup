echo -e "${BLUE}Instalando Driver Wifi${RESET}"
cd Sources/
git clone https://github.com/brektrou/rtl8821CU.git
cd rtl8821CU/
make
sudo make install
cd ..
rm -rf rtl8821CU/
cd ..
echo