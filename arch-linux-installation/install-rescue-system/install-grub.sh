#!/bin/bash

sudo arch-chroot $1 /bin/bash -c "su - -c 'cd ~/; grub-install -v --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB'"

sudo arch-chroot $1 /bin/bash -c "su - -c 'cd ~/; grub-mkconfig -o /boot/grub/grub.cfg'"