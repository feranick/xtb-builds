#!/bin/sh 

sudo apt -y update
sudo apt -y install  libblas-dev liblapack-dev libopenblas-dev 

install_folder=$HOME"/exec"

git clone https://github.com/grimme-lab/xtb.git
cd xtb
meson setup build_gpu --prefix=$install_folder -Dlapack=netlib -Dgpu=true -Dcusolver=true --wipe

ninja -C build_gpu install
