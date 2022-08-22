#!/bin/bash --login

#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --time=00:10:00

#SBATCH --partition=standard
#SBATCH --qos=standard
#SBATCH --export=none


printf "Start: %s\n" "`date`"

# Replaces, e.g.,
# module load openfoam/v2006

source ./site_profiling/modules.sh

export FOAM_INSTALL_PATH=`pwd`/openfoam

# Run test

source ${FOAM_INSTALL_PATH}/etc/bashrc

source ./site_profiling/test.sh

printf "Finish: %s\n" "`date`"
