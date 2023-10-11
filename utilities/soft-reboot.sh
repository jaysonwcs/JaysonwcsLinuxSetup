#!/bin/bash

# echo "Stopping display-manager"
# sudo systemctl stop display-manager

echo "Trying to stop AMDGPU driver"
sudo modprobe -r amdgpu

while [[ $? -ne 0 ]]
do
	sudo modprobe -r amdgpu
done

echo "Success!"

echo "Loading next kernel"
sudo kexec -l /boot/vmlinuz-linux-zen --initrd=/boot/initramfs-linux-zen.img --reuse-cmdline

echo "Rebooting now!"
sudo systemctl kexec
