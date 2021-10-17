echo -e "${BLUE}Configurando KVM/QEMU/Virt-Manager${RESET}"
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm
sudo chmod 770 /var/run/libvirt/libvirt-sock
rmmod kvm
modprobe -a kvm
echo