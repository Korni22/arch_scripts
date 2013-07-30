wget https://raw.github.com/Korni22/arch_scripts/master/scripts/hostname.sh &> /dev/null
mv hostname.sh /mnt/
chmod 777 /mnt/hostname.sh
arch-chroot /mnt/ /hostname.sh