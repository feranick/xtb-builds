#!/bin/sh 

install_folder=$HOME"/Software/xtb/xtb-bin"

git clone https://github.com/grimme-lab/xtb.git
cd xtb
#git fetch origin pull/1215/head 
meson setup build --prefix=$HOME/$install_folder --buildtype=release --wipe
ninja -C build install
