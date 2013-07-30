green='\e[0;32m' # Blau
echo -e "${green}Kernel is being generated...${NC}" # Textausgabe.
mkinitcpio -p linux &> /dev/null # Kernel wird generiert.