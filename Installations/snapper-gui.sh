echo -e "${BLUE}Instalando Snapper GUI${RESET}"
cd Sources/
git clone https://github.com/ricardomv/snapper-gui.git
cd snapper-gui/
python3 setup.py install
cd ..
rm -rf snapper-gui/
echo