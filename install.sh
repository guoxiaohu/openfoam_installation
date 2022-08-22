#!/usr/bin/env bash

set -e

# OpenFoam v2006 (June 2020)
# https://www.openfoam.com/download/install-source.php

export FOAM_INST_DIR=`pwd`
export version="v2206"

# This takes a few minutes.

# wget https://sourceforge.net/projects/openfoam/files/v2006/OpenFOAM-v2006.tgz
# wget https://sourceforge.net/projects/openfoam/files/v2006/ThirdParty-v2006.tgz

#git clone https://develop.openfoam.com/Development/openfoam.git ./openfoam-prof
#git clone https://develop.openfoam.com/Development/ThirdParty-common.git ./ThirdParty-common-prof
# tar zxf OpenFOAM-${version}.tgz
# tar zxf ThirdParty-${version}.tgz

# Patch various issues

export FOAM_SRC=${FOAM_INST_DIR}/OpenFOAM-${version}-profiling
#export FOAM_SRC=${FOAM_INST_DIR}/openfoam-prof
export FOAM_THIRDPARTY=${FOAM_INST_DIR}/ThirdParty-${version}
#export FOAM_THIRDPARTY=${FOAM_INST_DIR}/ThirdParty-common-prof
printf "Install OpenFOAM in FOAM_INST_DIR: %s\n" ${FOAM_INST_DIR}

# Install our site-specific preferences from ./site_profiling

cp ./site_profiling/prefs.sh ${FOAM_SRC}/etc/prefs.sh

# Thridparty patches

# Scotch
# Remove the "-m64" from the link stage in the Makefile
# that is, remove "$(WM_LDFLAGS)"

file=${FOAM_THIRDPARTY}/etc/makeFiles/scotch/Makefile.inc.Linux.shlib

sed -i "s/\$(WM_LDFLAGS)//" ${file}

# We will use FFTW from cray-fftw:
# fftw_version=fftw-system
# Remove FFTW_ARCH_PATH

config_file=${FOAM_SRC}/etc/config.sh/FFTW

sed -i "s/^fftw_version.*/fftw_version=fftw-system/" ${config_file}
sed -i "s/^export FFTW_ARCH_PATH.*//" ${config_file}

# Disable the paraview build cleanly:
# ParaView_VERSION=none

config_file=${FOAM_SRC}/etc/config.sh/paraview

sed -i "s/^ParaView_VERSION.*/ParaView_VERSION=none/" ${config_file}
