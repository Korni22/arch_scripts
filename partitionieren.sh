echo -e "${green}First, you are patitioning the disk.
This script uses /dev/sda1 as
system AND boot partition, so please be careful!
You are using \"cfdisk\" for this.
You control it using you arrow keys.
${NC}"
echo -e "${blue}Press any key to continue...${NC}"
read -n 1
cfdisk
echo -e "${green}Partitioning finished."