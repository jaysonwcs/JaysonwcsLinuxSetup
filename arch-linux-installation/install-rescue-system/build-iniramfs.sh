#!/bin/bash

sudo arch-chroot $1 /bin/bash -c "su - -c 'cd ~/; mkinitcpio -P'"