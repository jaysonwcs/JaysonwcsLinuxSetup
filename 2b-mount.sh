#!/bin/bash

#$1 = boot partition, $2 = system partition, $3 = mounted folder
#example:
#./2-create-subvols-and-mount.sh /dev/sda1 /dev/sda3 /mnt

mount $2 -o noatime,compress=zstd,commit=120,subvol=/@ $3
cd $3

if [ ! -d "btr_pool" ]; then
	CREATE_DIRS = true
fi

if [ $CREATE_DIRS = true ]
	mkdir {btr_pool,boot,home,root,var}
fi

mount $2 -o noatime,compress=zstd,commit=120,subvol=/ btr_pool
mount $1 boot
mount $2 -o noatime,compress=zstd,commit=120,subvol=/var/@main var
mount $2 -o noatime,compress=zstd,commit=120,subvol=@home home

if [ $CREATE_DIRS = true ]
	mkdir -p home/jayson/{.cache,.var,.local,Downloads,Games}
	mkdir home/jayson/.var/app
	mkdir -p home/jayson/.local/share/Steam
fi

mount $2 -o noatime,compress=zstd,commit=120,subvol=@games home/jayson/Games
mount $2 -o noatime,compress=zstd,commit=120,subvol=@steam home/jayson/.local/share/Steam
mount $2 -o noatime,compress=zstd,commit=120,subvol=@flatpak_home home/jayson/.var/app

if if [ $CREATE_DIRS = true ]
	mkdir btr_pool/@bkp_off/{downloads,cache_home}
	mkdir btr_pool/@bkp_off/{cache,tmp,downloads_root,cache_root}
fi

mount --bind btr_pool/@bkp_off/downloads home/jayson/Downloads
mount --bind btr_pool/@bkp_off/cache_home home/jayson/.cache

if [ $CREATE_DIRS = true ]if
	mkdir var/{cache,tmp,lib,snap}
	mkdir var/lib/flatpak
fi

mount $2 -o noatime,compress=zstd,commit=120,subvol=@snap var/snap
mount $2 -o noatime,compress=zstd,commit=120,subvol=@flatpak var/lib/flatpak

mount --bind btr_pool/@bkp_off/cache var/cache
mount --bind btr_pool/@bkp_off/tmp var/tmp

mount $2 -o noatime,compress=zstd,commit=120,subvol=@root_user root

if [ $CREATE_DIRS = true ]
	mkdir root/{.cache,Downloads}
fi

mount --bind btr_pool/@bkp_off/downloads_root root/Downloads
mount --bind btr_pool/@bkp_off/cache_root root/.cache

cd ~