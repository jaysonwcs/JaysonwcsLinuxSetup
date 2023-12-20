#!/bin/bash

execute-in-update-system() {
	~/JaysonwcsLinuxSetup/immutable-system/enter-update-system.sh

	/bin/arch-chroot "$@"

	~/JaysonwcsLinuxSetup/immutable-system/finish-system-update.sh
}