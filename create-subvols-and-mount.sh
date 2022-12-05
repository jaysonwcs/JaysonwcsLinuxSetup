#!/bin/bash

mount /dev/sda4 /mnt
cd /mnt

btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @etc
mkdir @etc/work
mkdir @etc/upper
mkdir -p users/jayson
btrfs subvolume create users/jayson/@games
btrfs subvolume create users/jayson/@steamapps
btrfs subvolume create users/jayson/@cache
mkdir var
btrfs subvolume create var/@flatpak
btrfs subvolume create var/@snap
btrfs subvolume create var/@cache
btrfs subvolume create var/@tmp
btrfs subvolume create var/@main
btrfs subvolume create @root_user
mkdir btrbk_snapshots
mkdir update_snapshots

cd -
umount /mnt

mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/@ /mnt
cd /mnt

mkdir {btr_pool,boot,home,root,var}
mkdir var/{cache,tmp,lib,snap}
mount /dev/sda1 boot
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@main var
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/@home home
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@cache var/cache
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@tmp var/tmp
mkdir var/lib/flatpak
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@flatpak var/lib/flatpak
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@snap var/snap
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/ btr_pool
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/@root_user root
