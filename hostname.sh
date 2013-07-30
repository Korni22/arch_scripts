blue='\e[2;34m' # blue
NC='\e[0m' # No Color
green='\e[0;32m' # green
echo -e "${blue}Please enter the desired hostname:${NC}"
read hostname
echo $hostname > /etc/hostname # Hostname wird auf kundenserver gesetzt.