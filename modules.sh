#!/usr/bin/bash

# Modules required at build time

module swap PrgEnv-cray PrgEnv-gnu
module load perftools-base
module load perftools
module load cray-fftw

# Modules required at compile time and at run time
