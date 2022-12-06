#!/bin/bash

sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
#sed -i 's/\#\[multilib\]/\[multilib\]/g' pacman.conf /etc/pacman.conf
#sed -i 's/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf

pacman -Sy

pacman -S archlinux-keyring

pacstrap /mnt base base-devel linux linux-headers linux-firmware linux-lts linux-lts-headers nano btrfs-progs kitty-terminfo git zsh

genfstab -U /mnt >> /mnt/etc/fstab

echo 'Verifique o fstab. Se estiver tudo certo, execute o arch-chroot'

arch-chroot /mnt
