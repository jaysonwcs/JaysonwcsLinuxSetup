#!/bin/bash

cp /boot/grub/grub.cfg /boot/grub/grub.cfg.bak
sed -i 's/@rw/@/g' /boot/grub/grub.cfg

umount -R /mnt

# mv /btr_pool/@ /btr_pool/@last
# btrfs subvolume snapshot -r /btr_pool/@rw /btr_pool/@