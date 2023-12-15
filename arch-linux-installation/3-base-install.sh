#!/bin/bash

#example: ./3-base-install.sh -a /mnt/system    (AMD)
#or: ./3-base-install.sh -i /mnt/system			(Intel)

sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
# sed -i 's/\#\[multilib\]/\[multilib\]/g' pacman.conf /etc/pacman.conf
# sed -i 's/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf

pacman -Sy

pacman -S archlinux-keyring

while getopts 'ia' OPTION; do
	case "$OPTION" in
		i)
			ucode="intel-ucode"
			;;
		a)
			ucode="amd-ucode"
			;;
	esac
done

pacstrap "$2" base base-devel linux-firmware linux-lts linux-lts-headers linux-zen linux-zen-headers nano btrfs-progs kitty-terminfo git zsh acpi rsync reflector arch-install-scripts "$ucode"

genfstab -U "$2" >> "$2"/etc/fstab

echo "overlay   /etc    overlay   x-systemd.requires=/btr_pool,defaults,index=off,metacopy=off,lowerdir=/etc,upperdir=/btr_pool/@etc/upper,workdir=/btr_pool/@etc/work    0   2" >> "$2"/etc/fstab

nano "$2"/etc/fstab

echo 'Verifique o fstab. Se estiver tudo certo, execute o arch-chroot'
