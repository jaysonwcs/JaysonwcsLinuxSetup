#!/bin/bash

# ./4-configure-system-step1.sh Laptop

ln -vsf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

hwclock --systohc -v

sed --debug -i 's/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/g' /etc/locale.gen

locale-gen

echo LANG=pt_BR.UTF-8 | tee -a /etc/locale.conf

echo KEYMAP=br-abnt2 | tee -a /etc/vconsole.conf

echo "$1" | tee -a /etc/hostname

echo '127.0.0.1  localhost' | tee -a /etc/hosts
echo '::1        localhost' | tee -a  /etc/hosts
echo "127.0.1.1  "$1".localdomain "$1"" | tee -a /etc/hosts

sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
sed -zi 's/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf
cat /etc/pacman.conf

sed -i 's/MODULES=()/MODULES=(btrfs)/g' /etc/mkinitcpio.conf
cat /etc/mkinitcpio.conf

# mkinitcpio -p linux
# mkinitcpio -p linux-zen
# mkinitcpio -p linux-lts

useradd -mG wheel jayson

cat /etc/passwd | grep jayson
cat /etc/group | grep jayson

chown -v jayson:jayson -R /home/jayson

echo "Defina a senha root"
passwd
echo "Defina a senha do usuário jayson"
passwd jayson

EDITOR=nano visudo
