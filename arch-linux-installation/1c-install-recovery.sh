#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] // [ -z "$3" ]
  then
    echo "Este script deve ser chamado passando o arquivo da ISO do Arch Linux, partição onde será instalado e partição EFI: comando [DEV-ARCH] [PART-DESTINO] [PART-EFI]"
    echo "Exemplo: ./1c-install-recovery.sh arch.iso /dev/sda2 /dev/sda1"

else
	echo "============================================================="
	echo "Iniciando script para arquivo ISO: $1 , partição recovery: $2, partição EFI: $3"
	echo "============================================================="
	echo
	echo "==> Gravando arquivo ISO $1 na partição $2"
	echo "--------------------------------------"

	dd bs=4M if=${1} of=$2 conv=fsync oflag=direct status=progress

	echo "--------------------------------------"
	echo

	echo "=> Criando pastas de montagem /mnt/arch-boot e /mnt/system-boot"

	mkdir /mnt/{arch-boot,system-boot}

	echo "=> Associando ISO $1 à um novo dispositivo loop"
	LOOPDEVICE=$(losetup -fP --show $1)
	echo ":::: Dispositivo loop criado para arquivo $1: $LOOPDEVICE"
	echo ""
	echo "=> Montando partição boot (${LOOPDEVICE}p2) do ISO $1 na pasta /mnt/arch-boot"
	mount ${LOOPDEVICE}p2 /mnt/arch-boot
	echo "=> Montando partição boot ($3) do sistema na pasta /mnt/system-boot"
	mount $3 /mnt/system-boot
	echo
	echo "==> Copiando arquivos de boot do ISO (montado em /mnt/arch-boot) para o sistema (montado em /mnt/system-boot)"
	echo "---------------------------------------------------"
	rsync -ahPvv /mnt/arch-boot/ /mnt/system-boot
	echo "---------------------------------------------------"

	echo
	echo "=> Desmontando e apagando pastas usadas (/mnt/arch-boot e /mnt/system-boot)"
	umount /mnt/arch-boot
	umount /mnt/system-boot

	rmdir /mnt/arch-boot
	rmdir /mnt/system-boot

	echo "=> Removendo dispositivo $LOOPDEVICE"
	losetup -d $LOOPDEVICE

	echo
	echo "==> Criando entrada de boot EFI para partição recovery"
	echo "------------------------------------------------------"

	EFILINE=$(efibootmgr -u | grep 'Recovery')
	EFIPOS=${EFILINE:4:4}

	if [ "$EFIPOS" != "" ]
	then
		efibootmgr -b $EFIPOS -B
	fi

	efibootmgr -d $3 -c -L "Recovery" -l '\EFI\BOOT\BOOTX64.EFI'

	echo
	echo "============================================================="
	echo "Script finalizado para arquivo ISO: $1 , partição recovery: $2, partição EFI: $3"
	echo "============================================================="
fi