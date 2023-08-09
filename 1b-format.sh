mkfs.fat -F32 /dev/sda1
mkswap /dev/sda3
swapon /dev/sda3
mkfs.btrfs -f /dev/sda4