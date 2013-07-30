blue='\e[2;34m' # Blau
#echo -e "${green}Welche Sprache ist gewünscht?${NC}" # Weitere Textausgaben um dem User alles zu erklären :)
#echo -e "${blue}1 für Deutsch, 2 für Englisch.${NC}" # Weitere Textausgaben um dem User alles zu erklären :)
#read n
#case $n in
#    1) wget https://raw.github.com/Korni22/arch_zfs/master/scripts/deutsch.sh &> /dev/null; mv deutsch.sh /mnt/; chmod 777 /mnt/deutsch.sh; arch-chroot /mnt/ /deutsch.sh for opn 1;;
#    2) wget https://raw.github.com/Korni22/arch_zfs/master/scripts/englisch.sh &> /dev/null; mv englisch.sh /mnt/; chmod 777 /mnt/englisch.sh; arch-chroot /mnt/ /englisch.sh for opn 2;;
#    *) invalid option;;
#esac
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/deutsch.sh &> /dev/null; mv deutsch.sh /mnt/; chmod 777 /mnt/deutsch.sh; arch-chroot /mnt/ /deutsch.sh