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
btrfs subvolume create @games
btrfs subvolume create @steam
btrfs subvolume create @flatpak_home
btrfs subvolume create @flatpak
btrfs subvolume create @snap
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

mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=@games home/jayson/Games
mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=@steam home/jayson/.local/share/Steam
mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=@flatpak_home home/jayson/.var/app

mkdir btr_pool/@bkp_off/{downloads,cache_home}
mkdir btr_pool/@bkp_off/{cache,tmp,downloads_root,cache_root}

mount --bind btr_pool/@bkp_off/downloads home/jayson/Downloads
mount --bind btr_pool/@bkp_off/cache_home home/jayson/.cache

mkdir var/{cache,tmp,lib,snap}
mkdir var/lib/flatpak

mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=@snap var/snap
mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=@flatpak var/lib/flatpak

mount --bind btr_pool/@bkp_off/cache var/cache
mount --bind btr_pool/@bkp_off/tmp var/tmp

mount /dev/sda3 -o noatime,compress=zstd,commit=120,subvol=@root_user root
mkdir root/{.cache,Downloads}

mount --bind btr_pool/@bkp_off/downloads_root root/Downloads
mount --bind btr_pool/@bkp_off/cache_root root/.cache

cd ~