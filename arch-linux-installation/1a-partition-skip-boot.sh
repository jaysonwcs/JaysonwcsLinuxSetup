#!/bin/bash


# bash x.sh /dev/sda 5 6

end_second_partition=$(($2 + $3))

echo "First: size $2 GiB, End: $2 GiB"
echo "Second: size $3 GiB, End: $end_second_partition GiB"

END_BOOT_PART=$(sudo parted -sa optimal -- "$1" print | grep boot | awk '{print $3}')

sudo parted -sa optimal -- "$1" \
# mklabel gpt \
# mkpart boot fat32 0% "$2"GiB set 1 boot on \
mkpart swap linux-swap "$END_BOOT_PART" "$end_second_partition"GiB set 2 swap on \
mkpart system btrfs "$end_second_partition"GiB -1 \
print