black='\e[0;30m' # black
blue='\e[2;34m' # blue
NC='\e[0m' # no color
green='\e[0;32m' # green
echo -e "${green}Bootloader is installing...${NC}"
pacman -Syu --noconfirm syslinux gptfdisk &> /dev/null
echo -e "${green}Bootloader is being configured...${NC}"
syslinux-install_update -i -a -m &> /dev/null #installs the bootloader and writes it to the MBR
sed -i 's/sda3 ro/sda1 rw/' /boot/syslinux/syslinux.cfg
sed -i 's/TIMEOUT 50/TIMEOUT 1/' /boot/syslinux/syslinux.cfg