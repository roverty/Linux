#!/bin/bash
echo -e '\e[1;33mWARNING: PLEASE before installing oracle g11 make sure you got java-jdk!\e[0m'
echo 'Press any key <e> to exit, any other key to continue'
echo -n 'OP> '
read key
if [ "$key" == 'e' ]; then
	echo 'Getting out....'
	exit
fi
#-----------------alien-------------------------------------
alien=$(dpkg -l | grep alien)
if [ "$alien" == "$false" ]; then
    echo -e '\e[1;37mInstalling alien ...\e[0m'
	sudo apt-get update
	sudo apt-get upgrade 
	sudo apt-get install alien    
else
    echo -e '\e[0;31mAlready installed alien \e[0m'      
fi
#--------------------------------------libaio1------------------------
libaio1=$(dpkg -l | grep libaio1)
if [ "$libaio1" == "$false" ]; then
    echo -e '\e[1;37mInstalling libaio1 ...\e[0m'
          
else
    echo -e '\e[0;31mAlready installed libaio1 \e[0m'      
fi
#-----------------libaio-dev-------------------------------------
libaiodev=$(dpkg -l | grep libaio-dev)
if [ "$libaiodev" == "$false" ]; then
    echo -e '\e[1;37mInstalling libaio-dev ...\e[0m'
	sudo apt-get install libaio-dev          
else
    echo -e '\e[0;31mAlready installed libaio-dev \e[0m'      
fi
#-----------------expat-------------------------------------
expat=$(dpkg -l | grep expat)
if [ "$expat" == "$false" ]; then
    echo -e '\e[1;37mInstalling expat ...\e[0m'
    sudo apt-get install expat      
else
    echo -e '\e[0;31mAlready installed expat \e[0m'      
fi
#-----------------sysstat-------------------------------------
sysstat=$(dpkg -l | grep sysstat)
if [ "$sysstat" == "$false" ]; then
    echo -e '\e[1;37mInstalling sysstat ...\e[0m'
    sudo apt-get install sysstat      
else
    echo -e '\e[0;31mAlready installed sysstat \e[0m'      
fi
#-----------------libelf-dev-------------------------------------
libelfdev=$(dpkg -l | grep libelf-dev)
if [ "$libelfdev" == "$false" ]; then
    echo -e '\e[1;37mInstalling libelf-dev ...\e[0m'
    sudo apt-get install libelf-dev     
else
    echo -e '\e[0;31mAlready installed libelf-dev \e[0m'      
fi
#-----------------elfutils-------------------------------------
elfutils=$(dpkg -l | grep elfutils)
if [ "$elfutils" == "$false" ]; then
    echo -e '\e[1;37mInstalling elfutils ...\e[0m'
	sudo apt-get install elfutils          
else
    echo -e '\e[0;31mAlready installed elfutils \e[0m'      
fi
#-----------------libstdc++5-------------------------------------
libstdc5=$(dpkg -l | grep libstdc++5)
if [ "$libstdc5" == "$false" ]; then
    echo -e '\e[1;37mInstalling libstdc++5 ...\e[0m'
    sudo apt-get install libstdc++5      
else
    echo -e '\e[0;31mAlready installed libstdc++5 \e[0m'      
fi
sudo ln -s /usr/bin/basename /bin/basename
sudo ln -s /usr/bin/awk /bin/awk
sudo mkdir /usr/lib64
sudo ln -s /usr/lib/x86_64-linux-gnu/libc_nonshared.a /usr/lib64/
sudo ln -s /usr/lib/x86_64-linux-gnu/libpthread_nonshared.a /usr/lib64/
sudo ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /usr/lib64/
sudo ln -s /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib64
sudo cp config1 /sbin/chkconfig
sudo chmod 755 /sbin/chkconfig
sudo cp config2 /etc/sysctl.d/60-oracle.conf
sudo cat /etc/sysctl.d/60-oracle.conf
sudo service procps start
sudo sysctl -q fs.file-max #Debe aparecer   fs.file-max = 6815744 sino sale el valor reinicia el servicio procps
sudo service procps restart
sudo sysctl -q fs.file-max
sudo ln -s /usr/bin/awk /bin/awk
sudo mkdir /var/lock/subsys
sudo touch /var/lock/subsys/listener
sudo cp /etc/security/limits.conf /etc/security/limits.conf.original #copia de seguridad
sudo echo -e '\n'>> /etc/security/limits.conf
cat config3 >> /etc/security/limits.conf 
sudo echo -e '\n'>> /etc/profile
cat config4 >> /etc/profile
sudo mkdir -p /u01/app/oracle
sudo mkdir -p /u01/app/oraInventory
sudo mkdir -p /u02/oradata
sudo chown oracle:oinstall /u01/app/oracle
sudo chown oracle:oinstall /u01/app/oraInventory
sudo chown oracle:oinstall /u02/oradata
sudo chmod 750 /u01/app/oracle
sudo chmod 750 /u01/app/oraInventory
sudo chmod 750 /u02/oradata
sudo rm -rf /dev/shm
sudo mkdir /dev/shm
sudo mount -t tmpfs shmfs -o size=6144m /dev/shm #Note2: En size se pone la cantidad de RAM  fisica que tenemos
sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb
echo -e '\e[1;33mWARNING: PLEASE make sure you have the .rpm file!\e[0m'
unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip
cd Disk1
sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm #previamente se intalo alien
sudo /etc/init.d/oracle-xe configure
sudo echo -e '\n'>> /etc/bash.bashrc
sudo cat config5 >> /etc/bash.bashrc
sudo service oracle-xe status
sudo service oracle-xe start