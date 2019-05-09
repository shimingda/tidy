#!/bin/bash

dpkg -i codemeter_6.50.2631.502_amd64.deb
service codemeter start
cmu --add-server xxxxx
cmu --list-server
