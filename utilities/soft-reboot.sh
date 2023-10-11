#!/bin/bash

sudo systemctl stop display-manager

sudo modprobe -r amdgpu

while [[ $? -ne 0 ]]
do
	sudo modprobe -r amdgpu
done

sudo kexec -l /boot/vmlinuz-linux-zen --initrd=/boot/initramfs-linux-zen.img --reuse-cmdline
sudo systemctl kexec
