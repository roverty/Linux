# Reparación de grub

## Pre-requisitos

* LiveUSB con linux, de prefencia con el mismo sistema operativo qu ese intenta reparar.

## Reparación

```shell
mount /dev/<partition used for Manjaro system> /mnt
mount /dev/<partition used for GRUB> /mnt/boot

mount -t proc proc /mnt/proc
mount -t sysfs sys /mnt/sys
mount -o bind /dev /mnt/dev
mount -t devpts pts /mnt/dev/pts/

sudo modprobe efivarfs # Only if needed

chroot /mnt
mount -t efivarfs efivarfs /sys/firmware/efi/efivars # Only if needed

sudo mount /dev/sdXY /boot/efi

grub-install /dev/sda

```

**Referencias y bibliografía**

* [Solución temporal](https://askubuntu.com/questions/929833/how-do-i-boot-my-pc-from-grub/931327#931327)
* [Solución temporal 2](https://askubuntu.com/questions/989238/grub-terminal-instead-of-menu)

* https://wiki.manjaro.org/index.php/Restore_the_GRUB_Bootloader