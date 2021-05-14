# Problemas resueltos

## La computadora se apago durante una actualización en progreso

Al reiniciar la máquina sale un problema más o menos así

```shell
Warning: /lib/modules/4.19.69-1-MANJARO/modules.devname not found - ignoring
ERROR: resume: hibernation device 'UUID=d421e020-e453-433a-04f0-b9905fa1deea' not found
mount /new_root: can't find UUID=11f43a7e-226e-4206-b274-fa322b50bab7
You are now being dropped into an emergency shell
sh: can't access tty: job control turned off
[rootfs ]#
```

Para corregirlo se debe utilizar una `live-usb` y se debe montar *nuestro* sistema operativo en el sistema del `live-usb` para lo cual se puede checar el siguiente enlace [Aquí](grub-repair.md) . Una vez montado el sistema basta con regnerar el kernel dañado.

```shell
mkinitcpio -p linux419 # donde 419 es la version del kernel que se quiere regenerar
```

Es posible consultar los kernel que tenemos instalados en el directorio mkinitcpio

```shell
ls /etc/mkinitcpio.d/
```

Después basta con actualizar el grub `update-grub` y listo.

**Referencias y bibliografía**

* **https://superuser.com/questions/1014212/how-do-i-fix-manjaro-error-hibernation-device-not-found-on-boot**
* https://wiki.manjaro.org/index.php/Restore_the_GRUB_Bootloader
* https://unix.stackexchange.com/questions/481857/archlinux-failed-to-boot-cant-access-tty-job-control-turned-off