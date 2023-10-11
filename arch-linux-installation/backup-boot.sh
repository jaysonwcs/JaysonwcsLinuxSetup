#!/bin/bash

# => /mnt/boot/ /mnt/mini/boot-backup

rsync -ahS --info=progress2 $1 $2