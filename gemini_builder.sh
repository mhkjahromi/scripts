#!/bin/bash
echo "*** Entering kernel source"
cd kernel_xiaomi_gemini 
echo "*** Exporting toolchains"
export CROSS_COMPILE=/home/mhkjahromi/Android_Developments/tmp/kernel-dev/gemini/backup/arm64-gcc/bin/aarch64-elf-
export CROSS_COMPILE_ARM32=/home/mhkjahromi/Android_Developments/tmp/kernel-dev/gemini/backup/arm32-gcc/bin/arm-eabi-
echo "*** Exporting arch and sub arch"
export ARCH=arm64 && export SUBARCH=arm64 
echo "*** Making kernel source clean"
make clean && make mrproper
echo "*** Cleaning output"
rm -rf  ../output && mkdir ../output
echo "*** Making defconfig"
make -C $(pwd) O=../output gemini_defconfig 
echo "*** Start building ..."
make -j12 -C $(pwd) O=../output
echo "*** Removing old zImage"
rm ~/Android_Developments/tmp/kernel-dev/gemini/backup/AnyKernel3-master/Image.gz-dtb
echo "*** Copying new zImage"
cp ~/Android_Developments/tmp/kernel-dev/gemini/backup/output/arch/arm64/boot/Image.gz-dtb ~/Android_Developments/tmp/kernel-dev/gemini/backup/AnyKernel3-master
export DATE_TIME="${d-`date "+%m%d-%H%M%S"`}"
echo "*** Enter AnyKernel path"
cd ~/Android_Developments/tmp/kernel-dev/gemini/backup/AnyKernel3-master
echo "*** Moving old builds to backup"
mv *.zip ~/Android_Developments/tmp/kernel-dev/gemini/backup/zipbackup
echo "*** Building Kernel zip"
zip -r9 Caffeine-Kernel-gemini-$DATE_TIME.zip * -x README.md Caffeine-Kernel-gemini-$DATE_TIME.zip
