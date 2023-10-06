#!/bin/bash

#exemplo: ./format-system.sh /dev/loop3 5 /mnt /mnt/usb/presystem.sfs

function define_vars {
    main_device="$1"
    partition_size="$2"
    mount_point="$3"
    squashfs_file="$4"
}

define_vars "$1" "$2" "$3" "$4"

device_type="$(echo "$main_device" | cut -b '6-9')"

if [ "$device_type" = "loop" ]; then
    main_device_parts="$main_device"p
else
    main_device_parts="$main_device"
fi

mounted_folder=$(mount | grep "$main_device_parts"2 | awk '{ print $3 }')
if [ -n "$mounted_folder" ]; then
    sudo umount -R "$mounted_folder"
fi

squash_device=$(losetup | grep "$squashfs_file" | awk '{ print $1 }')
if [ -n "$squash_device" ]; then
    mounted_squash=$(mount | grep "$squash_device" | awk '{ print $3 }')
    if [ -n "$mounted_squash" ]; then
        sudo umount -R "$mounted_squash"
    fi
fi

sudo parted -sa optimal -- "$main_device" \
mklabel gpt \
mkpart boot fat32 0% "$partition_size"GiB set 1 boot on \
mkpart mini ext4 "$partition_size"GiB -1 \
print

sudo mkfs.fat -F32 "$main_device_parts"1
sudo mkfs.ext4 "$main_device_parts"2

presystem_dir="$mount_point/pre-system"

if [ ! -d "$presystem_dir" ]; then
    sudo mkdir "$presystem_dir"
fi

sudo mount "$main_device_parts"2 "$presystem_dir"

if [ -n "$squash_device" ]; then
    presystem_device="$squash_device"
else
    presystem_device=$(sudo losetup -fP --show "$squashfs_file")
fi

squash_dir="$mount_point"/squashfs
if [ ! -d "$squash_dir" ]; then
    sudo mkdir "$squash_dir"
fi

sudo mount "$presystem_device" "$squash_dir"

sudo rsync -ahS --info=progress2 "$squash_dir"/ "$presystem_dir"