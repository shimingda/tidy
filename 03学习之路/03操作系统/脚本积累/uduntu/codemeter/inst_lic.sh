#!/bin/bash

dpkg -i codemeter_6.50.2631.502_amd64.deb
service codemeter start
cmu --add-server 106.2.214.38
cmu --list-server
