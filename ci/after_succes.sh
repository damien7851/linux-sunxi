#!/bin/bash

make deb-pkg KDEB_PKGVERSION=1 LOCALVERSION=1 KBUILD_DEBARCH=armhf
cp arch/arm/boot/uImage ../uImage
ls ..
echo $PWD

KERNEL_DIR=$PWD

git config --global user.name "damien7851"
git config --global user.email $MYMAIL

git checkout bin || git checkout --orphan bin
cd ..
rm -rf linux-sunxi/**/*
cd linux-sunxi
cp ../linux-image* .
cp ../uImage .
git add .
git commit -a -m "add modules pkg"
git push

