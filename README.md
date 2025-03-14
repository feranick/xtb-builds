# XTB builds

Source from here: 
https://github.com/grimme-lab/xtb/

## Running with GPU support
When running on NERSC with GPU support, these should be set as well:

```
echo "prereq nvhpc" >> ~/exec/xtb-gpu/share/modules/modulefiles/xtb/*
module use ~/exec/xtb-gpu/share/modules/modulefiles
module load nvhpc
module load xtb
```
