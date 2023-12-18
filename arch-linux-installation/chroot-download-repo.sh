#!/bin/bash

arch-chroot $1 /bin/bash -c "su - -c 'cd /; git clone https://github.com/jaysonwcs/JaysonwcsLinuxSetup'"