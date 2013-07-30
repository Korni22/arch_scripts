wget https://raw.github.com/Korni22/arch_scripts/master/scripts/passwort.sh &> /dev/null
mv passwort.sh /mnt/
chmod 777 /mnt/passwort.sh
arch-chroot /mnt/ /passwort.sh