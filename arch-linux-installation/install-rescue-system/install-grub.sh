#!/bin/bash

arch-chroot $1 /bin/bash -c "su - -c 'cd ~/; grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB'"

arch-chroot $1 /bin/bash -c "su - -c 'cd ~/; grub-mkconfig -o /boot/grub/grub.cfg'"