#!/bin/bash
echo "===============>init"
service mysql status|grep "running"
if [ 0 = $? ]
then
    echo "add data"
    mysql -u root --password=123456 < ./create_facepass.sql
    mysql -u root --password=123456 < ./init-view-schema.sql
    mysql -u root --password=123456 < ./biz_init.sql
    mysql -u root --password=123456 < ./init-security-data.sql
fi
