#!/bin/bash
echo 1
rpm -e redis-5.0.3-1.el6.remi.x86_64
rm -rf /etc/redis.conf.rpmsave
