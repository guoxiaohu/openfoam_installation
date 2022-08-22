#!/bin/bash --login

#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --tasks-per-node=1
#SBATCH --time=02:00:00

#SBATCH --account=c01
#SBATCH --partition=standard
#SBATCH --qos=standard
printf "Start: %s\n" "`date`"

export FOAM_VERBOSE=1

source ./site_profiling/modules.sh
module list

source ./site_profiling/compile.sh

# Record the envoronment variables

set | grep FOAM\_
set | grep WM\_

printf "Finish: %s\n" "`date`"
