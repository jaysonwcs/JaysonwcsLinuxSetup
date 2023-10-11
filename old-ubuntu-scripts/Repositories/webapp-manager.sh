echo -e "${BLUE}Adicionando repositório webapp-manager (Linux Mint)${RESET}"
read -p "Pressione [Enter] para continuar:"
mkdir Downloads
cd Downloads/
wget http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/linuxmint-keyring_2016.05.26_all.deb
read -p "Pressione [Enter] para continuar:"
sudo apt install ./linuxmint-keyring*.deb
sudo rm linuxmint-keyring_2016.05.26_all.deb
read -p "Pressione [Enter] para continuar:"
sudo sh -c 'echo "deb http://packages.linuxmint.com ulyssa main" >> /etc/apt/sources.list.d/mint.list'
read -p "Pressione [Enter] para continuar:"

sudo touch /etc/apt/preferences.d/mint-ulyssa-pin
read -p "Pressione [Enter] para continuar:"

cat << EOF | sudo tee /etc/apt/preferences.d/mint-ulyssa-pin
# Allow upgrading only webapp-manager from Ulyssa repository
Package: webapp-manager
Pin: origin packages.linuxmint.com
Pin-Priority: 500

# Never prefer other packages from the Ulyssa repository
Package: *
Pin: origin packages.linuxmint.com
Pin-Priority: 1
EOF
read -p "Pressione [Enter] para continuar:"
cd ..
echo
