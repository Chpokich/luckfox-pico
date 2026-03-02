#!/bin/bash
#
#

#export CPATH="$CPATH:/home/tools/linux/toolchain/arm-rockchip830-linux-uclibcgnueabihf/arm-rockchip830-linux-uclibcgnueabihf/sysroot/usr/include"
#export PATH="$PATH:/home/zelentcov/luckfox-pico/tools/linux/toolchain/arm-rockchip830-linux-uclibcgnueabihf/arm-rockchip830-linux-uclibcgnueabihf/sysroot/usr/include"

if [ "$1" == "1" ]; then 
  cp /home/sysdrv/source/buildroot/buildroot-2023.02.6/.config /home/sysdrv/source/buildroot/buildroot-2023.02.6/configs/luckfox_pico_w_defconfig
  rm -f output/image/update.img
  ./build.sh
elif [ "$1" == "2" ]; then 
  sudo upgrade_tool uf /home/zelentcov/luckfox/luckfox-pico/output/image/update.img
elif [ "$1" == "3" ]; then 
  scp $(pwd)/output/out/oem/usr/ko/sc3336.ko root@172.32.0.93:/root/$2
elif [ "$1" == "$NULL" ]; then 
  echo "ERROR: put the first param! 
    select one of the following: 
    1 -- build 
    2 -- emmc flash 
    3 -- copy sc3336.ko to luckfox"
fi

#cp /home/sysdrv/source/buildroot/buildroot-2023.02.6/.config /home/sysdrv/source/buildroot/buildroot-2023.02.6/configs/luckfox_pico_w_defconfig
#rm -f output/image/update.img
#./build.sh
#sudo upgrade_tool uf /home/zelentcov/luckfox/luckfox-pico/output/image/update.img
