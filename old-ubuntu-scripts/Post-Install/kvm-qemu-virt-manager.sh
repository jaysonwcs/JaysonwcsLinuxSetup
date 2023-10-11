echo -e "${BLUE}Configurando KVM/QEMU/Virt-Manager${RESET}"
read -p "Pressione [Enter] para continuar:"
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm
sudo chmod 770 /var/run/libvirt/libvirt-sock
rmmod kvm
modprobe -a kvm
read -p "Pressione [Enter] para continuar:"
echo
