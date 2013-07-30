blue='\e[2;34m' # blue
NC='\e[0m' # No Color
green='\e[0;32m' # green
echo -e "${green}System wird für die deutsche Sprache konfiguriert, bitte warten...${NC}"
echo LANG=de_DE.UTF-8 >> /etc/locale.conf # Sprache fürs System wird gesetzt.
export LANG=de_DE.UTF-8
echo KEYMAP=de-latin1 > /etc/vconsole.conf # Tastaturlayout wird gesetzt.
### Automatisches ersetzen von Kommentaren in /etc/locale.gen
sed -i 's/#de_DE.UTF-8 UTF-8/de_DE.UTF-8/' /etc/locale.gen
sed -i 's/#de_DE ISO-8859-1 UTF-8/de_DE ISO-8859-1/' /etc/locale.gen
sed -i 's/#de_DE@euro ISO-8859-1/de_DE@euro ISO-8859-1/' /etc/locale.gen
locale-gen
ln /usr/share/zoneinfo/Europe/Berlin /etc/localtime
echo -e "${green}Das System spricht nun deutsch :)${NC}"