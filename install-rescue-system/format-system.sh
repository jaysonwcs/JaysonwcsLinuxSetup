#!/bin/bash

#exemplo: ./format-system.sh /dev/loop3 5 /mnt /mnt/usb/presystem.sfs

# function define_vars {
#     main_device="$1"
#     partition_size="$2"
#     mount_point="$3"
#     squashfs_file="$4"
# }

# eval set -- "$(getopt -l edit:,list:,mount:,unmount:,help,debug -o e:l:m:u:hd "$@")"

cat << EOF
This script will format the device $_arg_device as follows:
	A first partition with $_arg_size GiB, where Grub and rescue system will be installed later
	A second partition using the remaining space left where the "pre-system" will be installed

This pre-system is used to install Grub and make the system bootable and, after that,
will install the rescue system (copy the ISO file and create the rescue system option on Grub)

All partitions/images that need to be mounted will be mounted bellow $_arg_mount directory.
This script will create 2 directories:
	$_arg_mount/presystem
	$_arg_mount/boot

The image used on the pre-system installation is this: $_arg_image.

This script is about to format the device $_arg_device and will ERASE EVERYTHING.
ARE YOU SURE YOU WANT TO CONTINUE? <y/N>
EOF

read -r answer
case "$answer" in
	y|Y)
		echo "Starting script";;
	*)
		exit;;
esac

declare -i num_of_flags=0

for flag in "$@"; do
    case $flag in
        -d|-s|-m|-i) ((num_of_flags+=1));;
    esac
done

if [[ $num_of_flags != 4 ]]; then
    echo "One of the flags were not sent. Please, send all flags"
    exit 1
fi

while getopts :d:s:m:i: option; do
    case $option in
        d) main_device=$OPTARG;;
        s) partition_size=$OPTARG;;
        m) mount_point=$OPTARG;;
        i) squashfs_file=$OPTARG;;
        *) echo "The flag $OPTARG doesn't exist"; exit 1;;
    esac
done

if [[ -z main_device || -z partition_size || -z mount_point || -z squash_device  ]]
then
    echo "You need to pass values to all flags"
fi

# define_vars "$1" "$2" "$3" "$4"

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