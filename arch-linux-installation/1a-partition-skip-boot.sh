#!/bin/bash


# bash x.sh /dev/sda 6

END_BOOT_PART=$(sudo parted -sa optimal -- "$1" print | grep boot | awk '{print $3}' | grep -o '[0-9]\+')

# end_second_partition=$(($2 + $3))
SIZE_IN_MB=$(($2 * 1024))
END_SECOND_PARTITION=$(($END_BOOT_PART + $SIZE_IN_MB))

# echo "First: size $2 GiB, End: $2 GiB"
echo "Second: size $2 GiB, End: $END_SECOND_PARTITION MB"

sudo parted -sa optimal -- "$1" \
mkpart swap linux-swap "$END_BOOT_PART"MB "$END_SECOND_PARTITION"MB set 2 swap on \
mkpart system btrfs "$END_SECOND_PARTITION"MB -1 \
print