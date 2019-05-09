#!/bin/bash
algorithmLibrary=/usr/share/DSFaceAlgm-2.3.0.1
grep "avx2" /proc/cpuinfo > /dev/null
if [ $? -eq 0 ];
then
    sudo cp -rf ./openblas0.2.19/HASWELL/libopenblas.so ${algorithmLibrary}
    echo "include avx2"
    exit;
fi
grep "avx" /proc/cpuinfo > /dev/null
if [ $? -eq 0 ]
then 
    sudo cp -rf ./openblas0.2.19/SANDYBRIDGE/libopenblas.so ${algorithmLibrary}
    echo "include avx"
    exit;
fi
echo "dynamic"
sudo cp -rf ./openblas0.2.19/DYNAMIC_ARCH/libopenblas.so ${algorithmLibrary}
