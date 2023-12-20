#!/bin/bash

#./enter-update-system.sh /dev/sda4

source functions.sh

btrbk -S --progress run

mount "$1" -o noatime,compress=zstd,commit=120,subvol=/@rw /mnt

/bin/arch-chroot /mnt bash << "_EOT_"
mount -a
umount /etc
_EOT_

arch-chroot /mnt