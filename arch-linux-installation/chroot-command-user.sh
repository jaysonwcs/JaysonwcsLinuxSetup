#!/bin/bash

arch-chroot $1 /bin/bash -c "su $2 - -c 'cd ~; $3'"