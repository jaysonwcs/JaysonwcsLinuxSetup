#!/bin/bash

# ./1b-format.sh /dev/sda

mkfs.fat -F32 "$1"1

lsblk "$1"1 -f

mkswap "$1"2
swapon "$1"2

lsblk "$1"2 -f

mkfs.btrfs -f "$1"3

lsblk "$1"3 -f