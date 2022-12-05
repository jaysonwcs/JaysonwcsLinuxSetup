#!/bin/bash

sudo parted -sa optimal -- /dev/sda \
mklabel gpt \
mkpart boot fat32 0% 512MiB set 1 boot on \
mkpart recovery fat32 512MiB 1536MiB \
mkpart swap linux-swap 1536MiB 7680MiB set 3 swap on \
mkpart system btrfs 7680MiB -1 \
print

mkfs.fat -F32 /dev/sda1
mkswap /dev/sda3
swapon /dev/sda3
mkfs.btrfs -f /dev/sda4

dd bs=4M if=/dev/sdb1 of=/dev/sda2 conv=fsync oflag=direct status=progress

efibootmgr -d /dev/sda1 -c -L "Recovery" -l '\EFI\BOOT\BOOTX64.EFI'

mkdir /mnt/{image,boot}
mount /dev/sdb1 /mnt/image
mount /dev/sda1 /mnt/boot
rsync -ahPv /mnt/image/EFI/ /mnt/boot

umount /mnt/image
umount /mnt/boot

rmdir /mnt/image
rmdir /mnt/boot
