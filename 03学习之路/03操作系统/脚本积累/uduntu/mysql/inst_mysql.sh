#!/bin/bash
#############################################################################################
# WARNING : the order of the installing can not be disordered ! ! ! ! !
#############################################################################################

## clean the password file before intall
sudo  dpkg -i deb/base/*.deb

sudo  dpkg -i deb/client/*.deb

sudo  dpkg -i deb/server/*.deb
#sudo apt-get install mysql-server

#sudo apt install mysql-client

#sudo apt install libmysqlclient-dev:

#sudo apt install -f

# start mysql
sudo service mysql start

# start on boot
#sudo chkconfig mysql on

# set new password
sudo ./init_facepass.sh

echo -en "\\033[1;32m"
echo "install mysql success"
