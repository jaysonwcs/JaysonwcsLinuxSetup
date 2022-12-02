#!/bin/bash

btrfs subvolume delete /btr_pool/@.old
SNAPSHOT=@upd.$(date +"%Y%m%dT%H%M%S")
btrfs subvolume snapshot -r /btr_pool/@ /btr_pool/update_snapshots/${SNAPSHOT}
mv /btr_pool/@ /btr_pool/@.old
btrfs subvolume snapshot /btr_pool/update_snapshots/${SNAPSHOT} /btr_pool/@
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/@ /mnt
arch-chroot /mnt
