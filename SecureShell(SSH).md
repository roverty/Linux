# Secure Shell (SSH)

[TOC]

## Breve introducción a la criptografía

## Criptografía simétrica

## Criptografía asimétrica

### DSA y RSA

Hablar de protocolo DSS

## PKI

El protocolo SSH es un método para logeos remotos seguros (secure remote login) de una computadora a otra.

SSH trabaja con el modelo cliente-servidor, lo que significa que se establece comunicación por un cliente SSH cliente conectandose a un servidor SSH.

El modelo de trabajo de SSH es el siguiente

![img1](./img/img1.png)

## Strong authentification

## Strong encryption

## Implementaciones de SSH

- [Tectia SSH](https://www.ssh.com/products/tectia-ssh/) cliernt & server for Windows, Unix, Linux - with 24x7 support
- [Tectia SSH for IBM z/OS](https://www.ssh.com/mainframe/) client & server for IBM z/OS mainframes - with 24x7 support
- [PuTTY](https://www.ssh.com/ssh/putty/) client for Windows and Linux
- [WinSCP](https://www.ssh.com/ssh/winscp/) client for Windows
- [CyberDuck](https://www.ssh.com/ssh/cyberduck/) client for Mac
- [OpenSSH](https://www.ssh.com/ssh/openssh/) server for Unix, Linux

## Uso y configuración de SSH

* ssh-agent
* ssh-keygen
* ssh-add

### Sintaxis básica 

`ssh {user}@{host}` 

Las banderas más comunes de utilizar son

* -p: para indicar el puerto a través del cual nos vamos a conectar.
* -v: verbose, para imprimir en pantalla todo lo que esta sucediendo.
* -o: para indicar una opción, las opciones válidas son:
  * "User=username"
  * "Port=portnumber"
  * "HostName=domain"
* -i : *IdentityFile* Especifica la ubicación de archivo de llava privada que queremos utilizar.
* -X : para poder iniciar aplicaciones que requieran de GUI

### Modificando los archivos de configuración

Tenemos dos archivos de configuración para ssh uno corresponde al cliente, identificado simplemente como *ssh* y otro corresponde al servidor y se identifica como *sshd*

Como la mayoría de los programas de GNU/Linux tenemos dos archivos de configuración, uno para el sistema (archivo global) y otro para el usuario que instaló el programa (archivo local).

- /etc/ssh/ssh_config 
- ~/.ssh/ssh_config (Si no existe debemos crearlo) **or** ~/.ssh/config (depende la versión, para saber cual debemos crear consultar `man ssh_config`).

Modificaremos el archivo local, es recomendable nunca tocar el archivo global. Además siempre debemos hacer un respaldo de los archivos que vayamos a modificar.

#### Host Reference

Para ahorrarnos tiempo en escribir `ssh {user}@{host}` podemos definir referencias a host a los que accedemos de manera muy frecuente, se hace agregando lo siguiente al archivo de configuración de *ssh*.

```shell
Host {give_a_name}
	User {username}
	Port {portnumber}
	HostName {hostname/staticIP}
```

Ahora para conectarnos, simplemente pondremos `ssh {given_name}`

#### Cambiar el puerto de SSH

Para cambiar el puerto de SSH debemos modificar el archivo de configuración global de SSH

`vim /etc/ssh/sshd_config`

Es importante modificar el archivo cuyo nombre es *sshd_config* y no *ssh_config*

Por defecto tenemos el puerto 22, i.e., `Port 22`, el cual podemos cambiar dentro de un rango del 1 al 65535, sin embargo habemos de considerar que los primeros 1024 puertos ya estan ocupados por otros servicios.

El último paso consiste en reiniciar el de demonio de ssh, como se sigue

`sudo systemctl restart sshd`

Ahora para poder establecer conexión remota debemos **especificar el puerto**

#### Un banner

#### Intentos máximos

#### PasswordAuthetication

#### X11 Forwarding

Al logearnos por SSH solo obtenemos una terminal como a la que estamos acostumbrados y no es posible acceder a ninguna aplicación que requiera del gestor de ventanas **X11**, sin embargo es posible que además de controlar un equipo de forma remota, también podamos instanciar aplicaciones de dicho equipo en nuestra computadora. 

Estas son las directivas que están asociadas con estas capacidades:

- **ForwardAgent**: esta opción permite que las claves de autenticación almacenadas en nuestra máquina local se reenvíen al sistema al que se está conectando. Esto puede permitirle saltar de host a host usando sus claves de inicio.
- **ForwardX11**: si desea poder reenviar una pantalla gráfica de una aplicación que se ejecuta en el sistema remoto, puede activar esta opción.

Primero debemos asegurarnos que ambos equipos tengan habilitada la opción x11Forwarding, esto se logra de la siguiente manera

* Accedemos al archivo de configuración de ssh `vim /etc/ssh/sshd_config`
* Buscamos 'X11Forwarding' a lo largo de archivo debe estar así `X11Forwarding yes`, es decir, `yes`para indicar que esta habilitado, `no` para indicar lo contrario
* Revisar si tenemos instalado xauth, sino, instalarlo
* Reiniciar el servicio

Hacemos esto en ambos equipos.

Ahora nos conectaremos al otro equipo, pero vamos a poner la bandera *-X*

i.e. `ssh {user}@{host} -X`

Ahora podemos instanciar aplicaciones GUI, por ejemplo 

* xclock
* firefox

#### ProxyCommand

#### IdentityFile

## Otros usos (SFTP y SCP)

## Bibliografía

https://www.ssh.com/ssh/#sec-The-SSH-protocol

https://www.hostinger.mx/tutoriales/que-es-ssh

https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client

https://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/

https://www.crucial.com.au/blog/2012/10/31/using-the-ssh-config-file/

https://help.ubuntu.com/community/SSH/OpenSSH/Configuring

http://linux-sys-adm.com/ubuntu-16.04-lts-how-to-install-and-configure-ssh/

https://en.wikipedia.org/wiki/Tunneling_protocol

vps