#!/bin/bash

#./enter-update-system.sh /dev/sda4

btrbk -S --progress run

btrfs subvolume delete /btr_pool/@last
btrfs subvolume delete /btr_pool/var/@main_last

mv /btr_pool/@ /btr_pool/@last
mv /btr_pool/var/@main /btr_pool/var/@main_last

btrfs subvolume snapshot -r /btr_pool/@rw /btr_pool/@
btrfs subvolume snapshot /btr_pool/var/@main_rw /btr_pool/var/@main