wget https://raw.github.com/Korni22/arch_scripts/master/scripts/sprachwahl.sh &> /dev/null
mv ./sprachwahl.sh /mnt/
chmod 777 /mnt/sprachwahl.sh
arch-chroot /mnt/ sprachwahl.sh