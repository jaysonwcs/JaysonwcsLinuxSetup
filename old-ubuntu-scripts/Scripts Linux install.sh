export BLUE='\e[34m'
export BOLD='\e[34m\e[1m'
export RESET='\e[22m\e[0m'

echo -e "${BOLD}Atualizando sistema:"
echo -e "====================${RESET}"

sudo apt update
read -p "Pressione [Enter] para continuar:"

sudo apt upgrade -y

read -p "Pressione [Enter] para continuar:"

sudo apt install -y build-essential

echo -e "${BOLD}Instalando drivers:"
echo -e "${BOLD}===================${RESET}"
echo

cd Drivers/

read -p "Pressione [Enter] para continuar:"

for f in *.sh; do
  bash "$f" 
done
cd ..

read -p "Pressione [Enter] para continuar:"

echo -e "${BLUE}Instalando curl para atualização dos reposisórios:${RESET}"
sudo apt install curl

echo -e "${BOLD}Preparando repositórios:"
echo -e "${BOLD}========================${RESET}"
echo

cd Repositories/

read -p "Pressione [Enter] para continuar:"

for f in *.sh; do
  bash "$f" 
done
cd ..


while read line
do
	echo -e "${BLUE}Adicionando PPA $line:${RESET}"
	sudo add-apt-repository -y $line
done < PPAs.txt 

read -p "Pressione [Enter] para continuar:"

echo -e "${BLUE}Atualizando APT${RESET}"
sudo apt update
echo

read -p "Pressione [Enter] para continuar:"

echo -e "${BOLD}Instalando pacotes APT:"
echo -e "${BOLD}=======================${RESET}"

read -p "Pressione [Enter] para continuar:"

while read line
do
	echo -e "${BLUE}Instalando $line:${RESET}"
	sudo apt install -y $line
done < "Apps apt.txt"
echo

read -p "Pressione [Enter] para continuar:"

sudo apt autoremove
read -p "Pressione [Enter] para continuar:"
sudo apt clean

read -p "Pressione [Enter] para continuar:"


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

read -p "Pressione [Enter] para continuar:"

echo -e "${BOLD}Instalando pacotes Flatpak:"
echo -e "${BOLD}===========================${RESET}"

read -p "Pressione [Enter] para continuar:"

while read line
do
	echo -e "${BLUE}Instalando $line:${RESET}"
	flatpak install flathub -y $line
done < "Apps flatpak.txt"
echo

read -p "Pressione [Enter] para continuar:"

echo -e "${BOLD}Instalações manuais:"
echo -e "${BOLD}====================${RESET}"
echo

cd Installations/

read -p "Pressione [Enter] para continuar:"

for f in *.sh; do
  bash "$f" 
done
cd ..

read -p "Pressione [Enter] para continuar:"

echo -e "${BOLD}Concluindo instalações:"
echo -e "=======================${RESET}"

cd Post-Install/

read -p "Pressione [Enter] para continuar:"

for f in *.sh; do
  bash "$f" 
done
cd ..

read -p "Pressione [Enter] para continuar:"

echo -e "${BOLD}Configurações do sistema"
echo -e "========================${RESET}"

cd System-Configs/

read -p "Pressione [Enter] para continuar:"

for f in *.sh; do
  bash "$f" 
done
cd ..

read -p "Pressione [Enter] para continuar:"

echo -e "${BOLD}Atualizando GRUB${RESET}"
sudo update-grub
echo

read -p "Pressione [Enter] para continuar:"

echo -e "${BOLD}Insalação concluída${RESET}"
echo -e "==================="

read -p "Pressione [Enter] para continuar:"
