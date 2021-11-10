echo -e "${BLUE}Instalando Driver Bluetooth${RESET}"
read -p "Pressione [Enter] para continuar:"

mkdir Downloads
cd Downloads/
CWD=$(pwd)
read -p "Pressione [Enter] para continuar:"
wget https://mpow.s3-us-west-1.amazonaws.com/mpow_BH519A_driver+for+Linux.7z
read -p "Pressione [Enter] para continuar:"
D=/lib/firmware;N=rtl8761;G=config;E=.bin
7z x ./mpow_BH519A_driver+for+Linux.7z
read -p "Pressione [Enter] para continuar:"
cd 202*/rtkbt-firmware/$D/rtlbt
S=sudo;D=$D/rtl_bt/$N
for C in a_ b_;do for L in fw $G;do F=$D$C$L$E;[ -f $F ]&&$S cp $F{,-`date +%s`};$S cp -f $N$C$L $F;done;done

sudo cp /lib/firmware/rtl_bt/rtl8761b_fw.bin /lib/firmware/rtl_bt/rtl8761bu_fw.bin
sudo cp /lib/firmware/rtl_bt/rtl8761b_config.bin /lib/firmware/rtl_bt/rtl8761bu_config.bin

cd "${CWD}"
read -p "Pressione [Enter] para continuar:"

rm -r 20201202_LINUX_BT_DRIVER
rm mpow_BH519A_driver+for+Linux.7z

echo
