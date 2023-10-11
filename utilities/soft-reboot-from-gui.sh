#!/bin/bash

echo "Stopping display-manager"
sudo systemctl stop display-manager

sudo openvt -c 12 -sf /home/jayson/Sources/jaysonwcsLinuxSetup/utilities/soft-reboot.sh