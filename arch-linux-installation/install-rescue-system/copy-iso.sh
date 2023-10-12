#!/bin/bash

#example: ./copy-iso.sh /dev/mapper/ventoy /mnt/pre-system/boot

dd if="$1" of="$2" bs=4M conv=fsync oflag=direct status=progress