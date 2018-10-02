# Servicios en Linux

[TOC]

Los servicios, mejor conocidos en Linux como **daemons** son procesos que se ejecutan en segundo plano, esperando a que ocurran determinados eventos y ofreciendo servicios, así mismo también pueden ser usados para realizar tareas del sistema de manera automatizada.

Los **daemons** surgen en 1960 en los laboratorios del MIT en el proyecto CTSS ( **C**ompatible **T**ime-**S**haring **S**ystem ). La palabra daemon tiene la misma raíz que la palabra "demon", pero la primera es más antigua y con significado ligeramente distinto. Los demonios son critaturas de libre pensamiento y voluntad.

Los daemons  fueron implementados por primera vez en el CTSS, luego pasaron al MUltics, de allí a UNIX y finalmente a GNU/Linux.

Básicamente hay dos tipos de demonios, los que inician en el *boot up* y aquellos que inician cuando el sistema ya ha cargado.

## Servicios por defecto

Por defecto, tenemos instalados ciertos demonios para que nuestra computadora pueda funcionar. A continuación se muestra una tabla de los principales demonios que tiene GNU/LINUX por defecto así como una breve explicación.

| Demonio           | Descripción                                                  |
| ----------------- | ------------------------------------------------------------ |
| alsa              | Guarda el estado de la tarjeta de sonido (*alsa-store.service, alsa-restore.service*). |
| Autofs            | Monta automáticamente medios extraibles o recursos compartidos de red cuando se insertan o se accede a ellos. |
| Avahi             | Permite a los programas encontrar automáticamente servicios de redes locales (*avahi-daemon.service*). |
| Bitlbee           | Aporta mensajería instantánea (XMPP, MSN, Yahoo!, AIM, ICQ). |
| Bluetooth         | Protocolo de Bluetooth, marco y subsistema.                  |
| ConnMan           | Administrador de conexiones de red cableadas e inalámbricas. |
| Cron              | Demonio para programar y temporizar eventos.                 |
| CUPS              | Demonio del sistema de impresión CUPS.                       |
| Dhcpcd            | Demonio de DHCP (*dhcpcd@.service*).                         |
| Dovecot           | Servidor IMAP y POP3.                                        |
| Dropbox           | Archivo multiplataforma de sincronización con control de versión (*dropbox@.service*). |
| Fan speed control | Demonio de control del ventilador (*fancontrol.service*).    |
| GDM               | Gestor de pantallas GNOME.                                   |
| Lightdm           | Gestor de pantallas libre.                                   |
| Git               | Demonio de GIT.                                              |
| gpm               | Soporte para el ratón de consola. (Ejemplo de vi).           |
| hddtemp           | Demonio para monitorizar la temperatura del disco duro.      |
| BIND              | Berkeley Internet Name Daemon (BIND), servidor DNS.          |
| NetworkManager    | Demonio de NetworkManager, proporciona la detección y configuración automática de conexiones de red. |
| samba             | Servicios de archivos e impresión para los clientes de Microsoft Windows. |
| openssh, sshd     | Demonio de OpenSSH (shell segura).                           |

**Ver mis demonios**

`ls /etc/init.d`

`service --status-all `

## Superdaemons

Los superdemonios son demonios que se inician en el *bootup process* y que controlan a otros demonios.

Los superdemonios más famosos son

* inetd (initd)
* System-V
* Systemd (Además de gestionar servicios, gestiona el sistema)
* Upstartd (`sudo <start|stop|etc...> <nombre_ servicio>`)

## Administración de servicios

Los servicios de linux pueden:

* Los superdemonios son demonios que se inician en el bootup process y que controlan a otros demonios.

* Ver estado (**status**)

* Empezar (**start**)

* Detener (**stop**)

* Reiniciar (**restart**)

* Recargar (**reload**)

* Habilitar (**enable**)

* Deshabilitar (**disable**)

* Enmascarar (**mask**)
  *  [Si no queremos que se pueda iniciar el servicio automaticamente ni manualmente ]

* Desenmascarar (**umask**)

  ## Comandos 	

`sudo /etc/init.d/<nombre_servicio> <estado> `

`sudo service <estado> <nombre_servicio> `

`systemctl <estado> <nombre_servicio> `
## Ejemplos de administración de servicios

- network manager
- display manager
- ssh
- apache (httpd)
- mysql
- cron

## Runlevels

Los runlevels o niveles de ejecución es un estado de ejecución en el que se puede encontrar el sistema Linux. Existen 7 niveles de ejecución en total, pero en Debian / Ubuntu no se hace distinción entre los niveles 2 al 5.

* Runlevel 0: Apagar la máquina.
* Runlevel 1: Arrancar en Modo Monousuario
* Runlevel 2 al 5: Arrancar en Modo Multiusuario con entorno gráfico si está instalado.
* Runlevel 6: Reiniciar la máquina.

Para indicar los procesos que se han de ejecutar o parar en cada runlevel, existen los directorios “/etc/rcX.d/”, donde X es el número de runlevel.

Dentro de estos directorios, lo que hay son enlaces simbólicos a los scripts existentes en “/etc/init.d/”

### Cambiar el niveles de ejecución de forma temporal

`init #runlevel`

### Cambiar el nivel de ejecución de forma permanente

```
sudo vim /etc/init/rc-sysinit.conf
env DEFAULT_RUNLEVEL=2
```