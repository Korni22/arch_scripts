blue='\e[2;34m' # blue
NC='\e[0m' # No Color
green='\e[0;32m' # green
echo -e "${green}System is being configured for english use...${NC}"
echo LANG=en_US.UTF-8 > /etc/locale.conf # Sprache fürs System wird gesetzt.
export LANG=en_US.UTF-8
locale-gen
ln /usr/share/zoneinfo/Europe/Berlin /etc/localtime
echo -e "${green}The system is now speaking english :)${NC}"