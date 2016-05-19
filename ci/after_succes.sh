#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make deb-pkg KBUILD_DEBARCH=armhf | grep -E 'dpkg-deb | warning | error'


cp arch/arm/boot/uImage ../uImage
echo "directorie listing : "$PWD
ls


cd  ..
git clone --depth=1 -b bin https://github.com/damien7851/linux-sunxi.git bin
rm -rf bin/*
cd bin
git config --global push.default simple
git config --global user.name "damien7851"
git config --global user.email $MYMAIL


cp ../linux-image* .
cp ../uImage .

git add .
git commit -a -m "add modules pkg"
git push --quiet https://$GH_TOKEN@github.com/$TRAVIS_REPO_SLUG bin

