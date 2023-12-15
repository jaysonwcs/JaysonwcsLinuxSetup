#!/bin/bash

# ./1b-format-skip-boot.sh /dev/sda

# mkfs.fat -F32 /dev/sda1
mkswap "$1"2
swapon "$1"2
mkfs.btrfs -f "$1"3