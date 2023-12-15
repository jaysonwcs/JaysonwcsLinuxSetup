#!/bin/bash

btrfs subvolume delete /btr_pool/@last
# SNAPSHOT=@upd.$(date +"%Y%m%dT%H%M%S")
# btrfs subvolume snapshot -r /btr_pool/@ /btr_pool/update_snapshots/${SNAPSHOT}
mv /btr_pool/@ /btr_pool/@last
# btrfs subvolume snapshot /btr_pool/update_snapshots/${SNAPSHOT} /btr_pool/@
mv /btr_pool/@rw /btr_pool/@
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/@ /mnt
# mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/@root_user /mnt/root
arch-chroot /mnt bash -c 'mount -a; umount /etc'
arch-chroot /mnt
