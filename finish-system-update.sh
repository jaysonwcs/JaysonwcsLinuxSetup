#!/bin/bash

umount -R /mnt
grub-mkconfig -o /boot/grub/grub.cfg
