#!/bin/bash

#./chroot-command-user.sh /mnt/system jayson '/' 'JaysonwcsLinuxSetup/download-setup-scripts.sh'

echo "arch-chroot into \"$1\" directory"
echo "Inside CHROOT:"
echo "change to user \"$2\""
echo "change to directory \"$3\""
echo "execute command \"$4\""
echo

arch-chroot "$1" /bin/bash -c "su $2 - -c 'cd $3; $4'"