#!/bin/bash

#./enter-update-system.sh /dev/sda4

SSD_options="noatime,compress=zstd,commit=120"

source functions.sh

# btrbk -S --progress run

# btrfs subvolume delete /btr_pool/@last

mount -v "$1" -o $SSD_options,subvol=/@rw /mnt

/bin/arch-chroot /mnt bash -c "mount -a; umount -R /etc; umount -R /var"

mount -v "$1" -o $SSD_options,subvol=/var/@main_rw /mnt/var
mount -v "$1" -o $SSD_options,subvol=@snap /mnt/var/snap
mount -v "$1" -o $SSD_options,subvol=@flatpak /mnt/var/lib/flatpak

mount -v --bind btr_pool/@bkp_off/cache var/cache
mount -v --bind btr_pool/@bkp_off/tmp var/tmp


execute-in-update-system /mnt

# /bin/arch-chroot /mnt
# arch-chroot /mnt zsh -c "su jayson - -c 'cd ~; $3'"