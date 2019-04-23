#!/bin/bash

sudo apt-get autoremove --purge mysql-server-5.7 
sudo apt-get remove mysql-server         # 没用到,已经没有mysql-server
sudo apt-get autoremove mysql-server  # 没用到,已经没有mysql-server
sudo apt-get remove mysql-common

sudo rm -rf /etc/mysql/  /var/lib/mysql    #很重要
#sudo rm -rf /usr/bin/mysq* /usr/share/mysql  /etc/mysql/  /var/lib/mysql  /var/run/mysqld/mysqld.sock  /usr/share/man/man1/mysql*  #很重要

#清理残留数据
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P  



