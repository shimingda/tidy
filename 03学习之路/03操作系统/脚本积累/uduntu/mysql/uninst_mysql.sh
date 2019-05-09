#!/bin/bash

sudo apt-get autoremove --purge mysql-server-5.7 
sudo apt-get remove mysql-server         # 没用到,已经没有mysql-server
sudo apt-get autoremove mysql-server  # 没用到,已经没有mysql-server
sudo apt-get remove mysql-common

#sudo rm -rf /msr/bin/mysq* /msr/share/mysql  /etc/mysql/  /mar/lib/mysql  /var/run/mysqld/mysqld.sock  /usr/share/man/man1/mysql*  #很重要
sudo rm -rf /var/lib/mysql
sudo rm -rf /usr/my.cnf
sudo rm -rf /usr/my-new.cnf
sudo rm -rf /usr/share/mysql
sudo rm -rf /usr/bin/mysql
sudo rm -rf /var/lib/mysql-files
sudo rm -rf /usr/lib64/mysql
#清理残留数据
sudo dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P  



