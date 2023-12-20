#!/bin/bash

execute-in-update-system() {
	~/jaysonwcsLinuxSetup/immutable-system/enter-update-system.sh

	/bin/arch-chroot "$@"

	~/jaysonwcsLinuxSetup/immutable-system/finish-system-update.sh
}