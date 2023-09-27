#!/bin/bash

mount /dev/sda3 /mnt
cd /mnt

btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @etc
mkdir @etc/work
mkdir @etc/upper
btrfs subvolume create @bkp_off
mkdir -p var/_btrbk_snap
btrfs subvolume create var/@flatpak
btrfs subvolume create var/@snap
btrfs subvolume create var/@main
btrfs subvolume create var/@plex
btrfs subvolume create @root_user
mkdir btrbk_snapshots

cd -
umount /mnt

mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/@ /mnt
cd /mnt

mkdir {btr_pool,boot,home,root,var}

mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/ btr_pool
mount /dev/sda1 boot
mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/var/@main var
mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=@home home

mkdir -p home/jayson/{.cache,.var,.local,Downloads,Games}
mkdir home/jayson/.var/app
mkdir -p home/jayson/.local/share/Steam

mkdir btr_pool/@bkp_off/{games,downloads,cache_home,flatpak_home,steam}

mount --bind btr_pool/@bkp_off/games home/jayson/Games
mount --bind btr_pool/@bkp_off/downloads home/jayson/Downloads
mount --bind btr_pool/@bkp_off/cache_home home/jayson/.cache
mount --bind btr_pool/@bkp_off/flatpak_home home/jayson/.var/app
mount --bind btr_pool/@bkp_off/steam home/jayson/.local/share/Steam

mkdir var/{cache,tmp,lib,snap}
mkdir var/lib/flatpak

mkdir btr_pool/@bkp_off/{cache,tmp,flatpak,snap,downloads_root,cache_root}

mount --bind btr_pool/@bkp_off/cache var/cache
mount --bind btr_pool/@bkp_off/tmp var/tmp
mount --bind btr_pool/@bkp_off/flatpak var/lib/flatpak
mount --bind btr_pool/@bkp_off/snap var/snap

# mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/var/@cache var/cache
# mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/var/@tmp var/tmp

# mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/var/@flatpak var/lib/flatpak
# mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/var/@snap var/snap

mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=@root_user root
mkdir root/{.cache,Downloads}

mount --bind btr_pool/@bkp_off/downloads_root root/Downloads
mount --bind btr_pool/@bkp_off/cache_root root/.cache

# mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/users/root/@downloads root/Downloads
# mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=/users/root/@cache root/.cache

# swapon /dev/sda3

cd ~