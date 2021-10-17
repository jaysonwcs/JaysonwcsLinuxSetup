echo -e "${BLUE}${BOLD}Editando GRUB:\n${RESET}"
sudo sed -i.bak 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="amd_iommu=on iommu=pt iommu=1 video=efifb:off quiet splash"/' /etc/default/grub
echo -e "${BLUE}${BOLD}GRUB editado:"
echo -e "${BLUE}${BOLD}=============${RESET}"
cat /etc/default/grub
echo