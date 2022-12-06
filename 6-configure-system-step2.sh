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

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/marlonrichert/zsh-hist.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-hist

sed -i 's/plugins=(git)/plugins=(git z zsh-autosuggestions safe-paste sudo themes zsh-hist)/g' ~/.zshrc

cd /
mkdir Sources
cd Sources

echo 'Instale o Paru e o Gnome e continue para o passo 3'
