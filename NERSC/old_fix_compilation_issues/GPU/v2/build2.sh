#!/bin/sh

#rm -rf test-bin  xtb_6.7.1_source_patched xtb-6.7.1-source.tar.xz
install_folder="test-bin"
mkdir $install_folder

module load python
conda create -y --name fera_env
conda activate fera_env
module load nvhpc
conda install -y meson ninja blas liblapack
wget https://github.com/grimme-lab/xtb/releases/download/v6.7.1/xtb-6.7.1-source.tar.xz
tar xvaf xtb-6.7.1-source.tar.xz
mv xtb_6.7.1_source a
patch -p0 -i build_xtb.patch
mv a xtb_6.7.1_source_patched
cd xtb_6.7.1_source_patched
#module load nvidia
#export FC=nvfortran CC=nvc
meson setup build_gpu --prefix=$HOME/$install_folder -Dlapack=netlib -Dgpu=true -Dcusolver=true --wipe
ninja -C build_gpu install
conda deactivate
module unload python
rm -rf $HOME/.conda 
