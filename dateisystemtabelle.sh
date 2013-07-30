green='\e[0;32m' # blue
genfstab -U -p /mnt > /mnt/etc/fstab &> /dev/null # Filesystemtable is generated
echo -e "${green}Filesystemtable is generated.${NC}"