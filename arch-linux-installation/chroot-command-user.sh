#!/bin/bash

#./chroot-command-user.sh /mnt/system jayson '/' 'JaysonwcsLinuxSetup/download-setup-scripts.sh'

arch-chroot $1 /bin/bash -c "su $2 - -c 'cd $3; $4'"