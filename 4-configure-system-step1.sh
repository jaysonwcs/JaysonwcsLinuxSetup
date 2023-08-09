#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

hwclock --systohc

sed -i 's/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/g' /etc/locale.gen

locale-gen

echo LANG=pt_BR.UTF-8 >> /etc/locale.conf

echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

echo Laptop >> /etc/hostname

echo '127.0.0.1  localhost' >> /etc/hosts
echo '::1        localhost' >> /etc/hosts
echo '127.0.1.1  Laptop.localdomain Laptop' >> /etc/hosts

sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
sed -zi 's/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf

sed -i 's/MODULES=()/MODULES=(btrfs)/g' /etc/mkinitcpio.conf

mkinitcpio -p linux
mkinitcpio -p linux-zen
mkinitcpio -p linux-lts

useradd -mG wheel jayson
chown jayson:jayson -R /home/jayson

echo 'Agora:'
echo '1) defina a senha dos usuários root e jayson (passwd e passwd jayson)'
echo '2) altere o arquivo visudo (EDITOR=nano visudo)'
echo '3) instale dotfiles no usuário padrão
echo '4) instale o OhMyZsh (scripts número 5)'
echo '...e siga para o próximo passo'
