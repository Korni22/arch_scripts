wget https://raw.github.com/Korni22/arch_scripts/master/scripts/kernel_generieren.sh &> /dev/null
mv kernel_generieren.sh /mnt/
chmod 777 /mnt/kernel_generieren.sh
arch-chroot /mnt/ /kernel_generieren.sh