#!/bin/bash

sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
# sed -i 's/\#\[multilib\]/\[multilib\]/g' pacman.conf /etc/pacman.conf
# sed -i 's/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf

pacman -Sy

pacman -S archlinux-keyring

pacstrap /mnt base base-devel linux-firmware linux-lts linux-lts-headers linux-zen linux-zen-headers nano btrfs-progs kitty-terminfo git zsh acpi rsync reflector amd-ucode

genfstab -U /mnt >> /mnt/etc/fstab

echo "#overlay   /etc    overlay   x-systemd.requires=/btr_pool/@etc,defaults,index=off,metacopy=off,lowerdir=/etc,upperdir=/btr_pool/@etc/upper,workdir=/btr_pool/@etc/work    0   2" >> /mnt/etc/fstab

nano /mnt/etc/fstab

echo 'Verifique o fstab. Se estiver tudo certo, execute o arch-chroot'
