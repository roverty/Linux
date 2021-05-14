# proyecto1
Primer proyecto de linux


#	@file firewall.sh,fwusb.sh, execute.sh, Blacklist.txt, Whitelist.txt
#	@Author Francisco Pablo, Rodrigo && Cecilia Silva Sandoval F.I.
#  Ing. Computación
#  PROTECO
#  PROTECO GENERACION 35
#	@date 26/08/17
#	@brief Script para controlar el montaje de dispositivos USB


Instrucciones
*Descargar los archivos a la misma carpeta
    #ERA LA IDEA PERO NO FUNCIONA AUN: execute.sh //Activador del Daemon
    fwusb.sh //Daemon
    firewall.sh //Programa
*Abrir el archivo fwusb.sh y poner la ruta de donde se descargo el archivo en "programa"
*Darles permismos a execute.sh con el comando: -- chmod 777 execute.sh
#ESTO NO:*Ejecutar el script execute.sh con el comando: -- ./execute.sh
*para arrancar el demonio colocamos las siguientes instrucciones en la terminal
*Debemos estar en la misma ubicacion que donde descargamos los archivos

    cp fwusb.sh /etc/init.d/
    chmod ug+x /etc/init.d/fwusb.sh
    ln -s /etc/init.d/fwusb.sh /etc/rc3.d/S30fwusb.sh
    ln -s /etc/init.d/fwusb.sh /etc/rc6.d/K05fwusb.sh
    ln -s /etc/init.d/fwusb.sh /etc/rc0.d/K05fwusb.sh

*Arrancar el Daemon con el comando: -- /etc/init.d/fwusb.sh start

Si lo desea puede parar el Daemon con el siguiente comando: --/etc/init.d/fwusb.sh stop
