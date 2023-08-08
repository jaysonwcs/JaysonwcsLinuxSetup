#!/bin/bash

mount /dev/sda4 /mnt
cd /mnt

btrfs subvolume create @
# btrfs subvolume create @home
btrfs subvolume create @etc
mkdir @etc/work
mkdir @etc/upper
mkdir -p users/jayson
btrfs subvolume create users/jayson/@games
btrfs subvolume create users/jayson/@steam
btrfs subvolume create users/jayson/@cache
btrfs subvolume create users/jayson/@main
btrfs subvolume create users/jayson/@flatpak
btrfs subvolume create users/jayson/@downloads
mkdir var
btrfs subvolume create var/@flatpak
btrfs subvolume create var/@snap
btrfs subvolume create var/@cache
btrfs subvolume create var/@tmp
btrfs subvolume create var/@main
btrfs subvolume create var/@plex
mkdir users/root
btrfs subvolume create users/root/@downloads
btrfs subvolume create users/root/@cache
btrfs subvolume create users/root/@main
mkdir btrbk_snapshots
# mkdir update_snapshots

cd -
umount /mnt

mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/@ /mnt
cd /mnt

mkdir {btr_pool,boot,home,root,var}
mkdir boot/efi
mount /dev/sda1 boot/efi
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@main var
mkdir home/jayson
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/jayson/@main home/jayson

mkdir home/jayson/{.cache,.var,.local,Downloads,Games}
mkdir home/jayson/.var/app
mkdir -p home/jayson/.local/share/Steam

mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/jayson/@games home/jayson/Games
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/jayson/@downloads home/jayson/Downloads
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/jayson/@cache home/jayson/.cache
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/jayson/@flatpak home/jayson/.var/app
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/jayson/@steam home/jayson/.local/share/Steam

mkdir var/{cache,tmp,lib,snap}
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@cache var/cache
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@tmp var/tmp
mkdir var/lib/flatpak
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@flatpak var/lib/flatpak
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/var/@snap var/snap
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/ btr_pool

mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/root/@main root
mkdir root/{.cache,Downloads}
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/root/@downloads root/Downloads
mount /dev/sda4 -o noatime,compress=zstd,commit=120,subvol=/users/root/@cache root/.cache

swapon /dev/sda3