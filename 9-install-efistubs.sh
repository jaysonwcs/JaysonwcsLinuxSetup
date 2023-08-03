#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Este script deve ser chamado passando o UUID da partição BTRFS e SWAP: EFISTUB [UUID-BTFS] [UUID-SWAP]"

else
	echo "UUID BTRFS: $1 , UUID SWAP: $2"

	echo "Comando:"
	echo "sudo efibootmgr -d /dev/sda1 -c -L \"Arch EFI\" -l '\vmlinuz-linux' -u \"root=UUID=$1 rw sysrq_always_enabled=1 resume=UUID=$2 rootflags=subvol=@ initrd=initramfs-linux.img\""
	
	sudo efibootmgr -d /dev/sda1 -c -L "Arch EFI" -l '\vmlinuz-linux' -u "root=UUID=$1 rw sysrq_always_enabled=1 resume=UUID=$2 rootflags=subvol=@ initrd=initramfs-linux.img root=UUID=acdbcc8f-901f-4a6b-a17d-6a36f7831d14 amd_iommu=on iommu=1 iommu=pt modprobe.blacklist=pcspkr,snd_pcsp fbcon=map:01 lsm=landlock,lockdown,yama,integrity,apparmor,bpf"

	sudo efibootmgr -d /dev/sda1 -c -L "Arch EFI LTS" -l '\vmlinuz-linux-lts' -u "root=UUID=$1 rw sysrq_always_enabled=1 resume=UUID=$2 rootflags=subvol=@ initrd=initramfs-linux-lts.img amd_iommu=on iommu=1 iommu=pt modprobe.blacklist=pcspkr,snd_pcsp fbcon=map:01 lsm=landlock,lockdown,yama,integrity,apparmor,bpf single nomodeset"

	#sudo efibootmgr -d /dev/sda1 -c -L "Grub" -l '\EFI\SYSTEM\grubx64.efi'

	#sudo efibootmgr -d /dev/sda1 -c -L "Recovery" -l '\EFI\BOOT\BOOTX64.EFI'
fi
