# Servidores web

Un servidor web es un ente de software que se encarga de satisfacer solicitudes de contenido estático de un sitio Web (páginas HTML, archivos, imágenes, video, etc.). Los clientes son quienes generan dichas solicitudes a través del protocolo HTTP ( Hypertext Transfer Protocol ).

![img](./img/img7.png)

[TOC]

## Protoco HTTP 

HTTP es un protocolo de comunicación que permite tranferencias de información en la Wold Wide Web (WWW).

Las características principales de HTTP

* Es un protocolo sin estado, no guarda ninguna información de las conexiones anteriores.
* Sigue el modelo cliente-servidor
* Los mensajes que se envian son texto plano.

## Application server

Un servidor de aplicación (application server) es un ente de software en una red distribuida que provee de las reglas de negocio de un sitio web, es decir, es el encargado de de generar contenido dinámico.

De manera lógica podríamos que el servidor de aplicación es el encargado de comunicar un servidor de base de datos (de donde se carga la información para actualizar las páginas) con un servidor web (el encargado de mandar dichas páginas).

![img](./img/img8.png)

<!-- serverlets -->

## Funcionamiento de un servidor web

Imaginemos el siguiente ejemplo, estamos sentados frente a nuestra computadora, navegando en la web y nos llega un mensaje de un amigo para ir al siguiente link http://agar.io/, en ese momento damos click al link y sin importar en que servidor web este el sitio web, se desplegará el contenido de este en la pantalla de nuestra computadora y eso se debe a que un servidor web siempre esta conectado a internet.

## Web Hostings

Es un servicio que  que permite a las organizaciones e individuos publicar un sitio web en Internet. Un *Web host* es una empresa que propociona tecnología y servicios necesarios para que sitio web se visualice en Internet.

Las principales tecnologías que se ofrecen son

* Manejador de base de datos (por lo general mysql)
* PHP

## Principales servidores web en el mercado

### Apache server

![img9](./img/img9.jpeg)

Es uno de los servidores más populares en el mundo, Apache es un servidor web de código abierto que soporta la mayoría de los sistemas operativos como Linux, Windows, FreeBSD, Mac OS X.

### NGINX server

![img9](./img/img10.png)

NGINX es un servidor de libre y de código abierto que incluye servidores proxy IMAP/POP3 . NGINX es bien conocido por su alto rendimiento, estabilidad, fácil configuración y **uso bajo de recursos**.

### IIS (Internet Information Services) web server

![img14](./img/img14.jpeg)

IIS es un producto de Microsoft y tiene las casi las mismas características que apache, excepto porque no es de código libre y además agregarle módulos se convierte en una tarea difícil. 

Además solo esta disponible para el sistema operativo Windows.

### Cherokee

![img13](./img/img13.png)

Cherokee es un servidor web multiplataforma cuyas caracteristicas principales son

* Es rápido, ligero (comparado con otros servidores ) y completamente funcional.
* LigEsta escrito en lenguaje C.
* Es un software libre.
* Soporta configuración de servidores virtuales.

### Otros

* Lighttpd ![img12](./img/img12.png)
* LightSpeed web server ![img11](./img/img11.png)

## XAMPP

## Certificados SSL

## Bibliografía

https://developer.mozilla.org/es/docs/Learn/Common_questions/Que_es_un_servidor_WEB

https://web.stanford.edu/class/cs142/cgi-bin/slides/WebServers.pdf

https://www.tutorialspoint.com/internet_technologies/pdf/web_servers.pdf

https://www.nginx.com/resources/glossary/application-server-vs-web-server/

https://www.fastwebhost.in/blog/what-is-web-server-and-different-types-of-web-servers/