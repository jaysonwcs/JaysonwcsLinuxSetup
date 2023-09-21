#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] // [ -z "$3" ]
  then
    echo "Este script deve ser chamado passando o arquivo da ISO do Arch Linux, partição onde será instalado e partição EFI: comando [DEV-ARCH] [PART-DESTINO] [PART-EFI]"
    echo "Exemplo: ./1c-install-recovery.sh arch.iso /dev/sda2 /dev/sda1"

else
	echo "Arquivo ISO: $1 , part recovery: $2, part EFI: $3"

	#echo "Comando:"
	# echo "sudo efibootmgr -d /dev/sda1 -c -L \"Arch EFI\" -l '\vmlinuz-linux' -u \"root=UUID=$1 rw sysrq_always_enabled=1 resume=UUID=$2 rootflags=subvol=@ initrd=initramfs-linux.img\""

	echo "==> Gravando arquivo ISO $1 na partição $2"
	echo "--------------------------------------"
	dd bs=4M if=${1} of=$2 conv=fsync oflag=direct status=progress

	echo
	echo "=> Criando pastas de montagem"
	mkdir /mnt/{arch-boot,system-boot}
	echo "=> Associando ISO à dispositivo loop"
	LOOPDEVICE=$(losetup -fP --show $1)
	echo ":: Loop criado: $LOOPDEVICE"
	echo ""
	echo "=> Montando partição boot do ISO"
	mount ${LOOPDEVICE}p2 /mnt/arch-boot
	echo "=> Montando partição boot do sistema"
	mount $3 /mnt/system-boot
	echo
	echo "==> Copiando arquivos de boot do ISO para o sistema"
	echo "---------------------------------------------------"
	rsync -ahPvv /mnt/arch-boot/ /mnt/system-boot

	echo
	echo "=> Desmontando e apagando pastas usadas"
	umount /mnt/arch-boot
	umount /mnt/system-boot

	rmdir /mnt/arch-boot
	rmdir /mnt/system-boot

	echo
	echo "=> Removendo dispositivo loop $LOOPDEVICE"
	losetup -d $LOOPDEVICE

	echo
	echo "==> Criando entrada de boot EFI para partição recovery"
	echo "------------------------------------------------------"
	efibootmgr -d $3 -c -L "Recovery" -l '\EFI\BOOT\BOOTX64.EFI'
fi