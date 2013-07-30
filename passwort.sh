black='\e[0;30m' # Schwarz
blue='\e[2;34m' # Blau
NC='\e[0m' # No Color
green='\e[0;32m' # Blau
echo -e "${blue}New password for \"root\":${NC}"
read -s passwort_1
echo -e "${blue}Re-enter password:${NC}"
read -s passwort_2
if [ "$passwort_1" == "$passwort_2" ]
	then echo root:$passwort_1 | chpasswd
else
	echo -e "${green}Passwords do not match!"
fi