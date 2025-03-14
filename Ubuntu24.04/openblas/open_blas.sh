#!/bin/sh 

sudo apt -y update
sudo apt -i install  libblas-dev liblapack-dev libopenblas-dev 

install_folder=$HOME"/Software/xtb/xtb-bin"

git clone https://github.com/grimme-lab/xtb.git
cd xtb
#git fetch origin pull/1215/head 
meson setup build --prefix=$install_folder --buildtype=release -Dlapack=openblas --wipe
ninja -C build install
