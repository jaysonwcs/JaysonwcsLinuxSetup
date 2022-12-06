#!/bin/bash

pacman -S - < packages_gui

systemctl enable gdm.service
