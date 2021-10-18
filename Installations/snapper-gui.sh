echo -e "${BLUE}Instalando Snapper GUI${RESET}"
read -p "Pressione [Enter] para continuar:"
cd Sources/
git clone https://github.com/ricardomv/snapper-gui.git
cd snapper-gui/
read -p "Pressione [Enter] para continuar:"
python3 setup.py install
cd ..
read -p "Pressione [Enter] para continuar:"
rm -rf snapper-gui/
read -p "Pressione [Enter] para continuar:"
echo
