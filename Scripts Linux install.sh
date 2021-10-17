export BLUE='\e[34m'
export BOLD='\e[34m\e[1m'
export RESET='\e[22m\e[0m'

echo -e "${BOLD}Atualizando sistema:"
echo -e "====================${RESET}"

sudo apt update
sudo apt upgrade



echo -e "${BOLD}Instalando drivers:"
echo -e "${BOLD}===================${RESET}"
echo

cd Drivers/
for f in *.sh; do
  bash "$f" 
done
cd ..



echo -e "${BOLD}Preparando repositórios:"
echo -e "${BOLD}========================${RESET}"
echo

cd Repositories/
for f in *.sh; do
  bash "$f" 
done
cd ..


while read line
do
	echo -e "${BLUE}Adicionando PPA $line:${RESET}"
	sudo add-apt-repository -y $line
done < PPAs.txt 


echo -e "${BLUE}Atualizando APT${RESET}"
sudo apt update
echo



echo -e "${BOLD}Instalando pacotes APT:"
echo -e "${BOLD}=======================${RESET}"
while read line
do
	echo -e "${BLUE}Instalando $line:${RESET}"
	sudo apt install -y $line
done < "Apps apt.txt"
echo

sudo apt autoremove
sudo apt clean




echo -e "${BOLD}Instalando pacotes Flatpak:"
echo -e "${BOLD}===========================${RESET}"
while read line
do
	echo -e "${BLUE}Instalando $line:${RESET}"
	flatpak install flathub --noninteractive $line
done < "Apps flatpak.txt"
echo



echo -e "${BOLD}Instalações manuais:"
echo -e "${BOLD}====================${RESET}"
echo

cd Installations/
for f in *.sh; do
  bash "$f" 
done
cd ..



echo -e "${BOLD}Concluindo instalações:"
echo -e "=======================${RESET}"

cd Post-Install/
for f in *.sh; do
  bash "$f" 
done
cd ..



echo -e "${BOLD}Configurações do sistema"
echo -e "========================${RESET}"

cd System-Configs/
for f in *.sh; do
  bash "$f" 
done
cd ..


echo -e "${BOLD}Atualizando GRUB${RESET}"
sudo update-grub
echo



echo -e "${BOLD}Insalação concluída${RESET}"
echo -e "==================="
