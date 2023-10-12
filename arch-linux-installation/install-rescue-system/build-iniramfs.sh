#!/bin/bash

sudo arch-chroot $1 /bin/bash -c "su - -c 'cd ~/; pacman -Sy'"

sudo arch-chroot $1 /bin/bash -c "su - -c 'cd ~/; pacman -S linux-lts'"