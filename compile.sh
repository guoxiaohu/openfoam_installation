#!/usr/bin/env bash

# To be run from FOAM_INST_DIR
# I make the dependencies first.

cd OpenFOAM-v2206-profiling
source ../site_profiling/modules.sh

# install.sh should be only run once
source ../site_profiling/install.sh

source ./etc/bashrc



./Allwmake -j 16 dep
./Allwmake -j 16 
