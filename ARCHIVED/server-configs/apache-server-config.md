# Apache

Apache HTTP Server es un software libre, multiplataforma y de código abierto. Es mantenido por la comunidad de desarrolladores de  la Apache Software Foundation.

Apache comenzó su desarrollo en 1995 y se basó inicialmente en el código del popular NCSA HTTPd.

Apache esta escrito en lenguaje C, C++ y Extensible Markup Languaje.

El servidor apache provee de un gran variedad de características como

* CGI (*Common Gateway Interface*).  tecnología de la World Wide Web que permite a un cliente (navegador web) solicitar datos de un programa ejecutado en un servidor web. 
* SSL
* Virtual domains
* Soporte para plug-in modules

[TOC]

En distintas distribuciones de linux debe de instalarse con el nombre `httpd` en lugar de apache, esto también sucede con el nombre de directorios o archivos de configuración.

## Instalación

`sudo apt install apache2` 

Ahora podemos entrar en nuestro navegador de preferencia y escribir `localhost` o la `dirección ip del servidor` para ver nuestro servidor en marcha.

## Archivos

| Archivos o directorios de configuración | Descripción                                                  |
| --------------------------------------- | ------------------------------------------------------------ |
| `/etc/apache2`                          | Archivos de configuración                                    |
| `/var/www/html`                         | Alojamiento de archivos de la sitio web                      |
| `/etc/apache2/apache2.conf`             | Es el principal archivo de configuración, casi todo se puede hacer desde este archivo, pero es recomendable separar las funcionalidades en distintos archivos. |
| `/etc/apache2/ports.conf`               | Este el archivo en donde se especifica en que puerto deben estar escuchando nuestros host virtuales. |
| `/etc/apache2/conf.d`                   | En este directorio se usa para controlar aspectos especificos del la configuración de Apache. |
| `/etc/apache2/sites-available`          | Este directorio contiene todos los archivos de los host virtuales que definen diferentes sitios web. |
| `/etc/apache2/sites-enabled`            | Este directorio especifica que host virtuales estan actualmente en uso. |
| `/etc/apache2/mods-[enable,available]`  | Definen modulos que pueden ser cargados opcionalmente.       |

El archivo principal de configuración esta divido en tres secciones:

* Definiciones globales
* Configuración del servidor por defecto
* Configuración de los host virtuales

Las configuraciones de Apache se hacen a través de directivas, es decir, ciertas palabras reservadas para especificarle a nuestro servidor ciertas configuraciones.

> La directiva más importante es la de *include* ya que nos permite incluir otros archivos de configuración dentro del archivo principal.

## Configuración global

En esta sección se específica como es que el servidor va a trabajar como un todo. Las principales directivas que debemos conocer son

### ServerType \< standalone | inetd \>

El tipo de servidor a ejecutar puede ser

* standalone: Este modo está por defecto y se refiere a que el servidor se ejecutará como un serivicio independiente.
* inetd : El serivicio se brindará de tipo xinet, es decir, se iniciará una copia del servidor cada vez que algún cliente trate de conectarse 

### ServerRoot < ruta_abs >

Esta directiva define el directorio donde se ubica toda la información de configuración y registro que necesita el servidor para su correcto funcionamiento,  debe de ser una ruta absoluta.

### PidFile \< ruta_abs \>

La directiva PidFile especifica la ruta del archivo PID (proceso ID).

### TimeOut \< tiempo_en_seg \>

Timeout define, en segundos, esl tiempo que el servidor esperará para recibir y enviar peticiones durante la comunicación, tras los cuales el servidor cierra la conexión. Está configurado por defecto a 300.

### KeepAlive \< On | Off \>

Esta directiva se utiliza para indicar si se activarán las conexiones persistentes; es decir,el poder hacer más de una petición por conexión.

Por ejemplo, supongamos que hacemos una petición al servidor de una página web que contiene tres imágenes, entonces tendremos que hacer 4 peticiones, una para la página y una por cada imagen. El tener activadas las conexiones persistentes nos permite el poder hacer todas las peticiones a través de la misma conexión, y no tener que negociar nuevas conexiones. La respuesta del servidor será más rápida y tendremos un mejor rendimiento.

### MaxKeepAliveRequests < numero_clientes >

Esta directiva establece el máximo número de peticiones que se pueden realizar en una conexión persistente. El valor predeterminado es 100.

### KeepAliveTimeout < tiempo_en_seg >

La directiva KeepAliveTimeout establece el número de segundos que el servidor esperará a la siguiente petición, tras haber dado servicio a una, antes de cerrar la conexión. Una vez recibida la petición, aplica la directiva Timeout en su lugar.

### MaxClients < numero_clientes >

Permite especificar la cantidad máxima de clientes conectados simultáneamente al servidor. Por defecto es 150. 

### LoadModule \< nombreModulo \> \< ubicacionFichero \>

Directiva que sirve para cargar módulos que incluyen distintas funcionalidades.

### Listen [dir_ip] \< puerto \>

Esta directiva permite especificar qué puerto se utilizará para atender las peticiones. Por defecto se utiliza el puerto 80.

Ejemplos

``` Apache
Para hacer que el servidor acepte conexiones en los puertos 80 y 8080
Listen 80
Listen 8080
```

```Apache
Para atender dos direcciones IP distintas, con distintos puertos, se utilizará:
Listen 192.168.255.5:80
Listen 192.168.255.8:8080
```

## Configuración del servidor principal

### ServerAdmin \< email \>

Especifica la dirección de correo electrónico del administrador. Esta dirección aparece en los mensajes de error, para permitir al usuario notificar un error al administrador.

### ServerName \< nombe \>[ip]

Especifica el nombre y el puerto que el servidor utiliza para identificarse, normalmente se determina automáticamente, pero es recomendable especificarlo 

### DocumentRoot < ruta_abs >

La carpeta raíz que se ubica en el servidor, desde la que se servirán los documentos. Por defecto, todas las peticiones tendrán como raíz esta carpeta. Esta es la carpeta donde colocaremos las páginas que queramos publicar.

### DirectoryIndex < index.html | \*.* ... > 

Especifica el fichero por defecto que buscará en cada directorio en caso de que no se especifique ninguno. Por defecto es index.html.

El orden con el que se especifica el nombre de fichero determinará la prioridad a la hora de decidir que fichero es el que se muestra.

### \< Directory [ruta]>

La opciones que vayan entre \<Directory> ... \</Directory> se establecen en el directorio base en lugar  de sobre el servidor.

### Directivas para Directory

![img15](./img/img15.png)

#### Options

#### AllowOverrride

#### Requiere

### AccessFileName

Es el nombre del fichero de configuración de acceso limitado que se buscará en cada una de los directorios del servidor para conocer la configuración del mismo. Este fichero permite configurar el comportamiento de cada uno de los directorios individualmente. Para que esta configuración funcione, la directiva AllowOverride tiene que tener un valor que lo permita. El nombre de fichero que se especifica por defecto es el del fichero .htaccess.

Como medida de seguridad, la configuración de Apache establece que no se muestre la existencia de este fichero a ningún usuario, aunque esté establecida la opción de listado de directorios.

```Apache
<Files ~ "^\.ht">
Order allow,deny
Deny from all
</Files>
```

### HostnameLookups

Se utiliza en los ficheros de registro. Por defecto, cuando se produce un acceso se guarda simplemente su número IP. Si esta directiva se encuentra en On, el servidor buscará la correspondencia de ese número IP con su nombre y lo almacenará. Establecer esta configuración en ON provocará que por lo menos se tenga que hacer una petición al servidor de nombres por cada una de las peticiones de usuario, por lo que el rendimiento de la máquina se puede ver decrementado.

### ErrorLog

Especifica la ubicación del fichero que contiene el registro de errores. Por defecto en la carpeta logs. 

### LogLevel

Especifica el tipo de mensajes que se guardarán en el fichero de registro de errores. Dependiendo de los valores especificados, se guardarán mas o menos.

Valor de más a menos son: debug, info, notice, warn, error, crit, alert, emerg.

## Configuración del host virtuales

Esta opción de Apache es muy útil en el caso de que contemos con más de un dominio en nuestro host; es decir, hosts virtuales.

Por defecto, Apache únicamente sirve el host del sitio Web especificado en la directiva ServerName. Es posible, sin embargo, hacer que Apache sirva a otros sitios Web utilizando una directiva de un contenedor de hosts virtuales. Hay que tener en cuenta que muchas de las directivas que hemos visto en la sección de Directivas básicas de configuración también se pueden aplicar a hosts virtuales.

### NameVirtualHost

Es necesario definir un número de IP y puerto para el host virtual. Para eso usamos esta directiva.

Aunque addr puede ser el nombre del host, es recomendable que se utilice siempre una dirección IP.

### \< VirtualHost addr[:port]….\>

 Todas las directivas encontradas entre \<VirtualHost> y \</VirtualHost> se aplican únicamente a dicho host virtual. Se puede utilizar cualquier directiva que esté permitida en el contexto de un host virtual

Ejemplo válido

Varias Direcciones IP con número de puerto

```Apache
<VirtualHost 192.168.1.110:8080 192.168.1.106:10000>
#directivas correspondientes a este host virtual
</VirtualHost>
```

### ServerAlias \<nombre1 | nombre2 ...\>

Esta directiva establece nombres alternativos para un host.

### ServerPath

Mediante ServerPath se define una localización en el host por defecto que se refiere al servidor virtual.

## Módulos de Apache2

Apache2 es un servidor modular. Ésto implica que solamente la funcionalidad más básica está incluida en el núcleo del servidor. Las características extendidas están disponibles a través de módulos que pueden cargarse en Apache2. Por defecto, un juego base de módulos esta incluido en el servidor en el momento de compilarlo. Si el servidor está compilado para usar módulos cargados dinámicamente, entonces los módulos pueden compilarse por separado y añadirse en cualquier momento usando la directiva LoadModule. De otra manera, Apache2 debe recompilarse para agregar o eliminar módulos.

### Módulo SSL

El módulo mod_ssl le agrega una característica importante al servidor Apache2 - la habilidad de encriptar comunicaciones. Así, cuando su navegador se esté comunicando usando SSL, se usa el prefijo https:// al comienzo del Localizador Uniforme de Recurso (URL) en la barra de navegación del navegador.

El módulo mod_ssl está disponible en el paquete apache2-common.

## Herramientas adicionales de Apache

* a2ensite
* a2dissite
* a2enmod
* a2dismod
* apachectl configtest

## Ejemplos

Configuración mínima y básica del servidor apache

```Apache
##
# Configuración global
##
ServerRoot "/etc/apache2"
PidFile "/home/stephen/apa"
Mutex file:${APACHE_LOCK_DIR} default
Timeout 300
KeepAlive On
MaxKeepAliveRequests 100
KeepAliveTimeOut 5


User stephen
Group stephen

HostnameLookups Off

ErrorLog "/home/stephen/apa/error.log"

LogLevel warn

IncludeOptional mods-enabled/*.load
IncludeOptional mods-enabled/*.conf


##
# Configuracion del servidor
##
ServerName www.misitioweb2.com
Listen 80
<Directory />
        Options FollowSymLinks
        #AllowOverride None
        Require all granted
        #denied
</Directory>

<Directory /usr/share>
        AllowOverride None
        Require all granted
</Directory>
<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
</Directory>
AccessFileName .htaccess
IncludeOptional conf-enabled/*.conf

#IncludeOptional sites-enabled/*.conf

ServerAdmin webmaster@locahost
DocumentRoot /var/www/html
ErrorDocument 404 /error404.html

```

Ejemplo de host virtuales

https://www.digitalocean.com/community/tutorials/como-configurar-virtual-host-de-apache-en-ubuntu-14-04-lts-es#paso-uno-crear-la-estructura-del-directorio

```Apache
<VirtualHost *:80>
	ServerName www.example.com
	DocumentRoot /var/www/html/example.com
	ServerAdmin rho@mail.com
	ErrorLog logs/example.com-error-log
	CustomLog logs/example.com-access_log common
	Directory index home.html
</VirtualHost>
<VirtualHost *:80>
	ServerName www.test.com
	ServerAlias test.com
	DocumentRoot /var/www/html/test
	ServerAdmin admin@test.com
</VirtualHost>
```

## Extra

### PHP

Para instala PHP y usarlo con nuestro servidor apache, basta con instalar los siguientes paquetes.

` apt install libapache2-mod-php php php-mysql php-fpm` 

### Error handling

`ErrorDocument 404 /var/www/error.php`