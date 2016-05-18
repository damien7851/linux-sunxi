#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make deb-pkg KDEB_PKGVERSION=1 LOCALVERSION=1 KBUILD_DEBARCH=armhf | grep -E 'dpkg-deb | warning | error'


cp arch/arm/boot/uImage ../uImage
echo "directorie listing : "$PWD
ls



git config --global push.default simple
git config --global user.name "damien7851"
git config --global user.email $MYMAIL

KERNEL_DIR=$PWD



git checkout bin || git checkout --orphan bin
cd ..
echo $PWD
rm -rf linux-sunxi/**/*
cd linux-sunxi
ls
cp ../linux-image* .
cp ../uImage .

git add .
git commit -a -m "add modules pkg"
git push --set-upstream origin bin

