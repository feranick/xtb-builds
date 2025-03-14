#!/bin/sh

rm -rf xtb
install_folder="exec/xtb-gpu"
mkdir $install_folder
module load python
conda create -y --name fera_env
conda activate fera_env
module load nvhpc
conda install -y meson ninja blas liblapack
git clone https://github.com/grimme-lab/xtb.git
cd xtb
git fetch origin pull/1215/head
meson setup build_gpu --prefix=$HOME/$install_folder -Dlapack=netlib -Dgpu=true -Dcusolver=true --wipe
ninja -C build_gpu install
conda deactivate
module unload python
rm -rf $HOME/.conda 
