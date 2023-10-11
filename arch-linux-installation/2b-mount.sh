#!/bin/bash

#$1 = boot partition, "$2" = system partition, $3 = mounted folder
#example:
#./2-create-subvols-and-mount.sh /dev/sda1 /dev/sda3 /mnt

SSD_options="noatime,compress=zstd,commit=120"

mount "$2" -o $SSD_options,subvol=/@ $3
cd "$3" || exit

if [ ! -d "btr_pool" ]; then
	CREATE_DIRS=true
fi

if [ "$CREATE_DIRS" = true ]; then
	mkdir {btr_pool,boot,home,root,var}
fi

mount "$2" -o $SSD_options,subvol=/ btr_pool
mount "$1" boot
mount "$2" -o $SSD_options,subvol=/var/@main var
mount "$2" -o $SSD_options,subvol=@home home

if [ "$CREATE_DIRS" = true ]; then
	mkdir -p home/jayson/{.cache,.var,.local,Downloads,Games}
	mkdir home/jayson/.var/app
	mkdir -p home/jayson/.local/share/Steam
fi

mount "$2" -o $SSD_options,subvol=@games home/jayson/Games
mount "$2" -o $SSD_options,subvol=@steam home/jayson/.local/share/Steam
mount "$2" -o $SSD_options,subvol=@flatpak_home home/jayson/.var/app

if [ "$CREATE_DIRS" = true ]; then
	mkdir btr_pool/@bkp_off/{downloads,cache_home}
	mkdir btr_pool/@bkp_off/{cache,tmp,downloads_root,cache_root}
fi

mount --bind btr_pool/@bkp_off/downloads home/jayson/Downloads
mount --bind btr_pool/@bkp_off/cache_home home/jayson/.cache

if [ "$CREATE_DIRS" = true ]; then
	mkdir var/{cache,tmp,lib,snap}
	mkdir var/lib/flatpak
fi

mount "$2" -o $SSD_options,subvol=@snap var/snap
mount "$2" -o $SSD_options,subvol=@flatpak var/lib/flatpak

mount --bind btr_pool/@bkp_off/cache var/cache
mount --bind btr_pool/@bkp_off/tmp var/tmp

mount "$2" -o $SSD_options,subvol=@root_user root

if [ "$CREATE_DIRS" = true ]; then
	mkdir root/{.cache,Downloads}
fi

mount --bind btr_pool/@bkp_off/downloads_root root/Downloads
mount --bind btr_pool/@bkp_off/cache_root root/.cache

cd ~ || exit