#!/bin/bash

pacman -Sy

# pacman -S reflector

reflector --country Brazil --sort rate --latest 15 --save /etc/pacman.d/mirrorlist

pacman -S - < ~/JaysonwcsLinuxSetup/arch-linux-installation/packates-lists/packages_pacman

# grub-install --target=x86_64-efi --efi-directory=/boot/efi --boot-directory=/boot/efi --bootloader-id=GRUB
grub-install -v --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

#sudo efibootmgr -d /dev/sda1 -c -L "Grub" -l '\EFI\SYSTEM\grubx64.efi'

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups
systemctl enable sshd
systemctl enable cronie
systemctl enable cockpit.socket
systemctl enable btrbk.timer
# systemctl enable gdm

# cd /
# mkdir Sources
# cd Sources
