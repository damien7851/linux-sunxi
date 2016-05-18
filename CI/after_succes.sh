#!/bin/bash

make deb-pkg KDEB_PKGVERSION=1 LOCALVERSION=1 KBUILD_DEBARCH=armhf > logdebpkg.log
cat logdebpkg.log | grep -E 'dpkg-deb | warning | error'
cp arch/arm/boot/uImage ../uImage
echo "directorie listing : "$PWD
ls ..


KERNEL_DIR=$PWD
git config --global push.default simple
git config --global user.name damien7851
git config --global user.email damien.pageot78@gmail.com

git checkout bin
cp ../linux-image* .
cp ../uImage .
git add .
git commit -a -m "add modules pkg"
git push

