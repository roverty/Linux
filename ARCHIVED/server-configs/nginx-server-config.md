# NGINX

NGINX es un servidor web ligero y de alto rendimiento, diseñado para casos de uso y alto tráfico.

[TOC]

## Instalación

`apt install nginx nginx-common`

## Archivos

| Archivos o directorios de configuración | Descripción                                                  |
| --------------------------------------- | ------------------------------------------------------------ |
| `/etc/nginx`                            | Ruta del archivo de configuración                            |
| `/var/www/html`                         | Alojamiento de archivos de la sitio web                      |
| `/etc/nginx/nginx.conf`                 | Es el principal archivo de configuración, casi todo se puede hacer desde este archivo, pero es recomendable separar las funcionalidades en distintos archivos. |
| `/etc/nginx/sites-available`            | Este directorio contiene todos los archivos de los host virtuales que definen diferentes sitios web. |
| `/etc/nginx/sites-enabled`              | Este directorio especifica que host virtuales estan actualmente en uso. |
| `/etc/nginx/mime.types`                 | El  tipo de MIME es un mecanismo para decirle al cliente la variedad de documentos transmitidos: la extensión de un nombre de archivo no tiene significado en la web. Por lo tanto es importante que el navegador esté correctamente configurada, el tipo de MIME  es transmitido con cada documento. |

## Configuración

Las opciones de configuración en Nginx son llamadas directivas. Las directivas están organizadas en grupos conocidos como **blocks** o **contextos.**

Las líneas que contengan directivas deben terminar con punto y coma `;`

### Contexts

La sintaxis general para describir un contexto o bloque es la siguiente

```nginx
nombre_contexto {
    #directivas
}
```

La única excepción de la sintaxis anterior es el contexto main-

#### main context

El archivo de configuración nginx.conf inicia con las siguientes directivas, que son parte del contexto `main`

* `user` Define las credenciales de usuario y grupo utilizadas por los procesos de trabajo.
* `worker_processes` 
  * Cuando una solicitud llega al servidor desde un proceso de trabajo del cliente es responsable de generar la solicitud y la respuesta.
  * *Analogía con las fondas*
  * El valor óptimo depende de muchos factores que incluyen (entre otros) la cantidad de núcleos de CPU, la cantidad de unidades de disco duro que almacenan datos y el patrón de carga.
* `error_log <ruta>` Define un archivo en donde se almacenan los errores presentados en nginx 
* `pid` Define un archivo en donde se almance el pid de nginx

#### event block

El contexto de "eventos" está contenido dentro del contexto "principal". Se usa para establecer opciones globales que afectan la forma en que Nginx maneja las conexiones a nivel general. Solo puede haber un contexto de eventos único definido dentro de la configuración de Nginx.

Nginx usa un modelo de procesamiento de conexión basado en eventos, por lo que las directivas definidas dentro de este contexto determinan cómo los procesos de trabajo deben manejar las conexiones. Principalmente, las directivas que se encuentran aquí se utilizan para seleccionar la técnica de procesamiento de conexión que se va a usar o para modificar la forma en que se implementan estos métodos.

#### http block

El bloque http contiene directivas para manejar el tráfico web. Estas directivas a menudo se denominan universales porque se transmiten a todas las configuraciones de sitios web que NGINX presta.

#### server block

El contexto del "servidor" se declara dentro del contexto "http" u otros y en el se especifan las configuraciones de nuestro servidor. Además de poder agregar en el ciertos módulos (tecnologías como ssl, php-fpm, ...).

* `servername`

#### mail block

Aunque Nginx se usa con mayor frecuencia como un servidor proxy web o inverso, también puede funcionar como un servidor proxy de correo de alto rendimiento.

Nginx tiene la capacidad de redirigir las solicitudes de autenticación a un servidor de autenticación externo. A continuación, puede proporcionar acceso a los servidores de correo POP3 e IMAP para servir los datos de correo reales.

#### location block

La ubicación se usa para manejar un cierto tipo de solicitud de cliente, y cada ubicación se selecciona en virtud de la coincidencia de la definición de ubicación con la solicitud del cliente a través de un algoritmo de selección.

## Herramientas de Nginx

`nginx -s <SIGNAL>`

En donde las señales pueden ser

* reload
* quit
* stop (apagado rápido)
* reopen

## Ejemplos

## Bibliografía

https://www.youtube.com/watch?v=WEIo9f4QbYM

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04s

https://www.digitalocean.com/community/tutorials/understanding-the-nginx-configuration-file-structure-and-configuration-contexts#the-core-contexts

https://www.linode.com/docs/web-servers/nginx/how-to-configure-nginx/#directives-blocks-and-contexts

https://learn.getgrav.org/webservers-hosting/servers/nginx

http://nginx.org/en/docs/ngx_core_module.html#events