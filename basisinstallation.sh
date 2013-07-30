echo -e "${green}Base system is being installed.
This takes about 5-15 minutes, depending on your internet connection...${NC}"
pacstrap /mnt base{,-devel} acpid dhcpcd git htop lftp nano net-tools ntp openssh rsync screen subversion unrar unzip wget wireless_tools ifplugd zsh &> /dev/null # System installation
echo -e "${green}Base system is installed.${NC}"