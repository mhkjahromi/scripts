#!/bin/bash
echo "Entering kernel source"
cd kernel_samsung_msm8226 
echo "Exporting toolchain"
export CROSS_COMPILE=/home/mhkjahromi/kernel-dev/NEO/backup/arm-linux-androideabi-4.9/bin/arm-linux-androideabi- 
echo "Exporting arch and sub arch"
export ARCH=arm && export SUBARCH=arm 
echo "Making kernel source clean"
make clean && make mrproper
echo "Cleaning output"
rm -rf  ../output && mkdir ../output
echo "Making defconfig"
make -C $(pwd) O=../output lineage_s3ve3gxx_defconfig 
echo "Start building ..."
make -j12 -C $(pwd) O=../output
echo "Removing old zImage"
rm ~/kernel-dev/NEO/backup/AnyKernel3-master/zImage
echo "Copying new zImage"
cp ~/kernel-dev/NEO/backup/output/arch/arm/boot/zImage ~/kernel-dev/NEO/backup/AnyKernel3-master
export DATE_TIME="${d-`date "+%m%d-%H%M%S"`}"
echo "Enter AnyKernel path"
cd ~/kernel-dev/NEO/backup/AnyKernel3-master
echo "Moving old builds to backup"
mv *.zip ~/kernel-dev/NEO/backup/zipbackup
echo "Building Kernel zip"
zip -r9 Caffeine-Kernel-$DATE_TIME.zip * -x README.md Caffeine-Kernel-$DATE_TIME.zip
