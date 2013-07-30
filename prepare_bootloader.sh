wget https://raw.github.com/Korni22/arch_scripts/master/scripts/bootloader.sh &> /dev/null
mv bootloader.sh /mnt/
chmod 777 /mnt/bootloader.sh
arch-chroot /mnt/ /bootloader.sh