#!/bin/bash

# ./1b-format-skip-boot.sh /dev/sda

# mkfs.fat -F32 /dev/sda1
mkswap "$1"2
swapon "$1"2

lsblk "$1"2 -f

mkfs.btrfs -f "$1"3

lsblk "$1"3 -f