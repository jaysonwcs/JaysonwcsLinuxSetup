#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

hwclock --systohc

sed -i 's/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/g' /etc/locale.gen

locale-gen

echo LANG=pt_BR.UTF-8 >> /etc/locale.conf

echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

echo Laptop >> /etc/hostname

echo '\n127.0.0.1  localhost\n::1        localhost\n127.0.1.1  Laptop.localdomain Laptop' >> /etc/hosts

sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
sed -i 's/\#\[multilib\]/\[multilib\]/g' /etc/pacman.conf
sed -i 's/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf

sed -i 's/MODULES=()/MODULES=(btrfs)/g' /etc/mkinitcpio.conf

mkinitcpio -p linux

useradd -mG wheel jayson

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'Defina agora a senha dos usuários root e jayson, altere o arquivo visudo e siga para o passo 2'

