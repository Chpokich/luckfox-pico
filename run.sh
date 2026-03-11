#!/bin/bash
CURRENT_DIR=$(pwd)

if [ "$1" == "1" ]; then 
  #cp /home/sysdrv/source/buildroot/buildroot-2023.02.6/.config /home/sysdrv/source/buildroot/buildroot-2023.02.6/configs/luckfox_pico_w_defconfig
  rm -f $CURRENT_DIR/output/image/update.img
  ./build.sh
elif [ "$1" == "2" ]; then 
  sudo upgrade_tool uf $CURRENT_DIR/output/image/update.img
elif [ "$1" == "3" ]; then 
  scp $CURRENT_DIR/output/out/oem/usr/ko/sc3336.ko root@172.32.0.93:/root/$2
elif [ -z "$1" ]; then 
  echo "ERROR: put the first param! 
    select one of the following: 
    1 -- build 
    2 -- emmc flash 
    3 -- copy sc3336.ko to luckfox"
fi
