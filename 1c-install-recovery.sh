#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] // [ -z "$3" ]
  then
    echo "Este script deve ser chamado passando a partição da ISO do Arch Linux, partição onde será instalado e partição EFI: comando [PART-ARCH-ISO] [PART-DESTINO] [PART-EFI]"

else
	echo "Part Arch: $1 , part recovery: $2, part EFI: $3"

	echo "Comando:"
	echo "sudo efibootmgr -d /dev/sda1 -c -L \"Arch EFI\" -l '\vmlinuz-linux' -u \"root=UUID=$1 rw sysrq_always_enabled=1 resume=UUID=$2 rootflags=subvol=@ initrd=initramfs-linux.img\""
	
	dd bs=4M if=$1 of=$2 conv=fsync oflag=direct status=progress

	mkdir /mnt/{image,boot}
	mount $1 /mnt/image
	mount $2 /mnt/boot
	rsync -ahPv /mnt/image/ /mnt/boot

	umount /mnt/image
	umount /mnt/boot

	rmdir /mnt/image
	rmdir /mnt/boot

	efibootmgr -d $3 -c -L "Recovery" -l '\EFI\BOOT\BOOTX64.EFI'
fi