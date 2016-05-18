#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
 
make sun7i_defconfig
make -j`getconf _NPROCESSORS_ONLN` uImage modules
