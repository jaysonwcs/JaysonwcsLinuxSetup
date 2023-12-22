#!/bin/bash

#./enter-update-system.sh /dev/sda4

source functions.sh

# btrbk -S --progress run

# btrfs subvolume delete /btr_pool/@last

mount "$1" -o noatime,compress=zstd,commit=120,subvol=/@rw /mnt
mount "$1" -o noatime,compress=zstd,commit=120,subvol=/var/@main_rw /mnt/var

/bin/arch-chroot /mnt bash << "_EOT_"
mount -a
umount -R /etc
_EOT_

execute-in-update-system /mnt

# /bin/arch-chroot /mnt
# arch-chroot /mnt zsh -c "su jayson - -c 'cd ~; $3'"