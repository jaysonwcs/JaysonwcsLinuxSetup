#!/bin/bash

sudo parted -sa optimal -- /dev/sda \
mklabel gpt \
mkpart boot fat32 0% 512MiB set 1 boot on \
mkpart recovery fat32 512MiB 1536MiB \
mkpart swap linux-swap 1536MiB 7680MiB set 3 swap on \
mkpart system btrfs 7680MiB -1 \
print