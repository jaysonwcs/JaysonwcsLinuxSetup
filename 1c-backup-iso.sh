#!/bin/bash

if [ -z "$1" ]
  then
    echo "Este script deve ser chamado passando o disco (dispositivo) onde a ISO deve ser gravada"
    echo "Exemplo: ./1c-backup-iso.sh /dev/sda2"
else
	dd if=$1 of=arch.img bs=4M conv=fsync,sparse status=progress
fi