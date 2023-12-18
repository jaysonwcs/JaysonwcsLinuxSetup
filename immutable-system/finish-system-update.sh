#!/bin/bash

umount -R /mnt
# grub-mkconfig -o /boot/grub/grub.cfg
mv /btr_pool/@ /btr_pool/@rw
btrfs subvolume snapshot -r /btr_pool/@rw /btr_pool/@