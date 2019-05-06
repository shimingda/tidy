#!/bin/bash

SETCOLOR_SUCCESS="echo -en \\033[1;32m"
SETCOLOR_NORMAL="echo -en \\033[0;39m"


sudo dpkg -i deb/*.deb
sudo apt install -f

$SETCOLOR_SUCCESS && echo "install JDK success" && $SETCOLOR_NORMAL
