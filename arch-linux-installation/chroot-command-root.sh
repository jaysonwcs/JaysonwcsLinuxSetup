#!/bin/bash

arch-chroot $1 /bin/bash -c "su - -c 'cd /; $2'"