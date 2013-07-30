blue='\e[2;34m' # blue
NC='\e[0m' # No Color
green='\e[0;32m' # green
rm -rf partitionieren.sh &> /dev/null
rm -rf formatieren.sh &> /dev/null
rm -rf mount.sh &> /dev/null
rm -rf basisinstallation.sh &> /dev/null
rm -rf prepare_dateisystemtabelle.sh &> /dev/null
rm -rf prepare_sprachwahl.sh &> /dev/null
rm -rf prepare_hostname.sh &> /dev/null
rm -rf prepare_kernel.sh &> /dev/null
rm -rf prepare_passwort.sh &> /dev/null
rm -rf prepare_bootloader.sh &> /dev/null
clear
echo -e "${green}Welcome to my Arch Linux setup script.

Output that informs you, is green.
Output, that requires your input is${blue} blue.

${NC}"
umount /mnt &> /dev/null
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/partitionieren.sh &> /dev/null
source ./partitionieren.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/formatieren.sh &> /dev/null
source ./formatieren.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/mount.sh &> /dev/null
source ./mount.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/basisinstallation.sh &> /dev/null
source ./basisinstallation.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/prepare_sprachwahl.sh &> /dev/null
source ./prepare_sprachwahl.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/prepare_hostname.sh &> /dev/null
source ./prepare_hostname.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/dateisystemtabelle.sh &> /dev/null
source ./dateisystemtabelle.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/prepare_kernel.sh &> /dev/null
source ./prepare_kernel.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/prepare_passwort.sh &> /dev/null
source ./prepare_passwort.sh
wget https://raw.github.com/Korni22/arch_scripts/master/scripts/prepare_bootloader.sh &> /dev/null
source ./prepare_bootloader.sh
umount /mnt &> /dev/null
echo -e "${green}Installation complete!.${NC}"
echo -e "${green}System is rebooting...${NC}"
sleep 30
reboot
### ToDo:
## Postinstall
# [ ] DHCP und SSH aktivieren
# [ ] oh-my-zsh konfigurieren
# [ ] ntpd-Krams
# [ ] Pacman weitere Paketlisten hinzufügen
# [ ] Aufräumen