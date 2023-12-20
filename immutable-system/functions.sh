#!/bin/bash

execute-in-update-system() {
	sudo ~/JaysonwcsLinuxSetup/immutable-system/enter-update-system.sh

	sudo /bin/arch-chroot "$@"

	sudo ~/JaysonwcsLinuxSetup/immutable-system/finish-system-update.sh
}