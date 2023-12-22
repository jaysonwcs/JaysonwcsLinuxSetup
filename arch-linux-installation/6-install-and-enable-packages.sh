#!/bin/bash

pacman -Sy

reflector --country Brazil --sort rate --latest 15 --save /etc/pacman.d/mirrorlist

pacman -S - < ~/JaysonwcsLinuxSetup/arch-linux-installation/packates-lists/packages_pacman

grub-install -v --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups
systemctl enable sshd
systemctl enable cronie
systemctl enable cockpit.socket
systemctl enable btrbk.timer
