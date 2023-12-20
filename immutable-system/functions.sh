#!/bin/bash

arch-chroot() {
	/bin/arch-chroot "$@"
	~/jaysonwcsLinuxSetup/immutable-system/finish-system-update.sh
}