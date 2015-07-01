#!/bin/bash

# colored echo
# Black        0;30     Dark Gray     1;30
# Blue         0;34     Light Blue    1;34
# Green        0;32     Light Green   1;32
# Cyan         0;36     Light Cyan    1;36
# Red          0;31     Light Red     1;31
# Purple       0;35     Light Purple  1;35
# Brown/Orange 0;33     Yellow        1;33
# Light Gray   0;37     White         1;37

green='\033[0;32m'
yellow='\033[1;33m'
NC='\033[0m' # No Color

partition_disks(){
	echo -e "${green}First, you are patitioning the disk.
	This script uses /dev/sda1 as
	system AND boot partition, so please be careful!
	You are using \"cfdisk\" for this.
	You control it using you arrow keys.${NC}"
	echo -e "${yellow}Press any key to continue...${NC}"
	read -n 1
	cfdisk && \
	echo -e "${green}Partitioning finished."
}

format_disks(){
	mkfs.ext4 /dev/sda1 &> /dev/null && \
	echo -e "${green}formatting finished.${NC}"
}

mount_disks(){
	mount /dev/sda1 /mnt && \
	echo -e "${green}/dev/sda1 mounted.${NC}"
}

install_basesystem() {
	echo -e "${green}Base system is being installed.
	This takes about 5-15 minutes, depending on your internet connection...${NC}"
	pacstrap /mnt base{,-devel} git htop lftp nano ntp openssh rsync screen unrar unzip wget zsh &> /dev/null
	echo -e "${green}Base system is installed.${NC}"
}

generate_fstab(){
	green='\e[0;32m' # blue
	genfstab -U -p /mnt > /mnt/etc/fstab &> /dev/null # Filesystemtable is generated
	echo -e "${green}Filesystemtable is generated.${NC}"
}

generate_kernel(){
	echo -e "${green}Kernel is being generated...${NC}" # Textausgabe.
	mkinitcpio -p linux &> /dev/null # Kernel wird generiert.
}

install_bootloader() {
	echo -e "${green}Bootloader is installing...${NC}"
	pacman -Syu --noconfirm syslinux gptfdisk &> /dev/null
	echo -e "${green}Bootloader is being configured...${NC}"
	syslinux-install_update -i -a -m &> /dev/null #installs the bootloader and writes it to the MBR
	sed -i 's/sda3 ro/sda1 rw/' /boot/syslinux/syslinux.cfg
	sed -i 's/TIMEOUT 50/TIMEOUT 1/' /boot/syslinux/syslinux.cfg
}

pick_language(){
	echo -e "${green}Wich language do you want?${NC}" # Weitere Textausgaben um dem User alles zu erklären :)
	echo -e "${green}1 for german, 2 for english.${NC}" # Weitere Textausgaben um dem User alles zu erklären :)
	read n
	case $n in
    1) setup_german;;
    2) setup_english;;
    *) invalid option;;
esac
}

setup_german(){
	echo -e "${green}System wird für die deutsche Sprache konfiguriert, bitte warten...${NC}"
	echo LANG=de_DE.UTF-8 >> /etc/locale.conf # Sprache fürs System wird gesetzt.
	export LANG=de_DE.UTF-8
	echo KEYMAP=de-latin1 > /etc/vconsole.conf # Tastaturlayout wird gesetzt.
	### Automatisches ersetzen von Kommentaren in /etc/locale.gen
	sed -i 's/#de_DE.UTF-8 UTF-8/de_DE.UTF-8/' /etc/locale.gen
	locale-gen
	ln /usr/share/zoneinfo/Europe/Berlin /etc/localtime
	echo -e "${green}Das System spricht nun deutsch :)${NC}"
}

setup_english(){
	echo -e "${green}System is being configured for english usage...${NC}"
	echo LANG=en_US.UTF-8 > /etc/locale.conf # Sprache fürs System wird gesetzt.
	export LANG=en_US.UTF-8
	locale-gen
	ln /usr/share/zoneinfo/Europe/Berlin /etc/localtime
	echo -e "${green}The system is now speaking english :)${NC}"
}

change_password(){
	echo -e "${yellow}New password for \"root\":${NC}"
	read -s passwort_1
	echo -e "${yellow}Re-enter password:${NC}"
	read -s passwort_2
	if [ "$passwort_1" == "$passwort_2" ]
		then echo root:"$passwort_1" | chpasswd
	else
		echo -e "${green}Passwords do not match!${NC}"
	fi
}