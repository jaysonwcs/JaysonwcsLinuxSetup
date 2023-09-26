#!/bin/bash

sudo parted -sa optimal -- /dev/sda \
mklabel gpt \
mkpart boot fat32 0% 2048MiB set 1 boot on \
# mkpart recovery fat32 512MiB 1536MiB \
mkpart recovery fat32 2048MiB 7168MiB \
mkpart swap linux-swap 7168MiB 13312MiB set 3 swap on \
mkpart system btrfs 13312MiB -1 \
print