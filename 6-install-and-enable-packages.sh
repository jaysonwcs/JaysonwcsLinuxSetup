#!/bin/bash

pacman -Sy

pacman -S - < packages_pacman

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=SYSTEM

grub-mkconfig -o /boot/grub/grub.cfg

#sudo efibootmgr -d /dev/sda1 -c -L "Grub" -l '\EFI\SYSTEM\grubx64.efi'

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups
systemctl enable sshd.service
systemctl enable cronie.service
systemctl enable cockpit.socket
systemctl enable gdm.service

cd /
mkdir Sources
cd Sources

echo 'Instale o Paru e continue para o passo 7'
