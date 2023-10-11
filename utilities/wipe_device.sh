#!/bin/bash

if [[ -e "$1" && -b "$1" ]];then 
NOT_safe="$(lsblk -o "NAME,MOUNTPOINT" ${1//[0-9]/} | grep -e / -e '\]')";
 if [[ -z "$NOT_safe" ]];then
# Here you can use any of your favourite wiping tools 
# to wipe destination passed on command line and stored in variable "$1"
# 
	echo 'Yay';
	dd if=/dev/zero of=$1 conv=fsync oflag=direct bs=4M status=progress;
  else
  	echo 'Not allowed to destroy if any of the partitions is mounted: '"$NOT_safe";
 fi
fi 
