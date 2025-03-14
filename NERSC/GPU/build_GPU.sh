#!/bin/sh

rm -rf xtb
install_folder=$HOME"/exec/xtb-gpu"
mkdir $install_folder

module load python
conda create -y --name fera_env
conda activate fera_env
module load nvhpc
conda install -y meson ninja blas liblapack
git clone https://github.com/grimme-lab/xtb.git
cd xtb
meson setup build_gpu --prefix=$install_folder -Dlapack=netlib -Dgpu=true -Dcusolver=true --w>
ninja -C build_gpu install
conda deactivate
module unload python
rm -rf $HOME/.conda
