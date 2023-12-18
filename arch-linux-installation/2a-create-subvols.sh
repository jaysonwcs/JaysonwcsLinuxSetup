#!/bin/bash

# $1 = system partition, $2 = mounted folder
#example:
#./2-create-subvols-and-mount.sh /dev/sda3 /mnt
mount -v $1 $2
cd $2

btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @etc
mkdir -v @etc/work
mkdir -v @etc/upper
btrfs subvolume create @bkp_off
mkdir -v -p var/_btrbk_snap
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
mkdir -v btrbk_snapshots

tree

cd -
umount -v $2