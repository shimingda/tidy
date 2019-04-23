#!/bin/bash

#################################################
# import related scripts
#################################################
#source ../color_function.sh
#apt-get update
#apt-get install rabbitmq-server

sudo  dpkg -i deb/relong/*.deb

sudo  dpkg -i deb/server/*.deb

#SET USER
rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator
rabbitmqctl set_permissions test ".*" ".*" ".*"
rabbitmq-plugins enable rabbitmq_management
# set rabbitmq start on boot
#systemctl start rabbitmq-server;
#systemctl enable rabbitmq-server;
#systemctl stop rabbitmq-server;

# use rabbitmq user account to operate MQ!!!!
#PRT_CONFIGURE RabbitMQ

#PRT_CONFIGURE "Waiting RabbitMQ start (8sec)..."
#su rabbitmq << EOF
#cd /usr/lib/rabbitmq/bin/
#./rabbitmq-server -detached
#sleep 8
#./rabbitmqctl add_user $1 $2
#./rabbitmqctl set_user_tags $1 administrator
#./rabbitmqctl set_permissions -p / $1 ".*" ".*" ".*"
#./rabbitmq-plugins enable rabbitmq_management
#exit;
#EOF
#PRT_RESULT
#SET USER
#systemctl start rabbitmq-server;
#systemctl enable rabbitmq-server;
#systemctl stop rabbitmq-server;
