#!/bin/bash

export INSTALL_MOD_PATH=../mod
make -j`getcoonf _NPROCESSORS_ONLN` modules_install
make deb-pkg KDEB_PKGVERSION=1 LOCALVERSION=1 KBUILD_DEBARCH=armhf
cp arch/arm/boot/uImage ../uImage
ls ..
echo $PWD

KERNEL_DIR=$PWD

git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL

git checkout bin
cp ../linux-image* .
cp ../uImage .
git add .
git commit -a -m "add modules pkg"
git push

