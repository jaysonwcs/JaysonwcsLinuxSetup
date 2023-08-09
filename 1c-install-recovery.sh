#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] // [ -z "$3" ]
  then
    echo "Este script deve ser chamado passando o disco (dispositivo) da ISO do Arch Linux, partição onde será instalado e partição EFI: comando [DEV-ARCH] [PART-DESTINO] [PART-EFI]"

else
	echo "Dev Arch: $1 , part recovery: $2, part EFI: $3"

	echo "Comando:"
	echo "sudo efibootmgr -d /dev/sda1 -c -L \"Arch EFI\" -l '\vmlinuz-linux' -u \"root=UUID=$1 rw sysrq_always_enabled=1 resume=UUID=$2 rootflags=subvol=@ initrd=initramfs-linux.img\""
	
	dd bs=4M if=${1}1 of=$2 conv=fsync oflag=direct status=progress

	mkdir /mnt/{arch-boot,system-boot}
	mount ${1}2 /mnt/arch-boot
	mount $3 /mnt/system-boot
	rsync -ahPv /mnt/arch-boot/ /mnt/system-boot

	umount /mnt/arch-boot
	umount /mnt/system-boot

	rmdir /mnt/arch-boot
	rmdir /mnt/system-boot

	efibootmgr -d $3 -c -L "Recovery" -l '\EFI\BOOT\BOOTX64.EFI'
fi