#!/bin/bash

SETCOLOR_SUCCESS="echo -en \\033[1;32m"
SETCOLOR_NORMAL="echo -en \\033[0;39m"

sudo apt-get remove openjdk*

$SETCOLOR_SUCCESS && echo "uninstall JDK success" && $SETCOLOR_NORMAL
