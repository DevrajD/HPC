#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjobAll

#SBATCH -t 00:5:00

# Number of nodes
#SBATCH --nodes=1
# Number of MPI processes per node
#SBATCH --ntasks-per-node=9

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell


DEBUG=1
rm my_controloutput_files*
for i in "6 3" "6 2"
do
    set -- $i
    echo $1 and $2
    N=$(( $1 ))
    N_BAR=$(( $2 ))
    PROCESSES=$(( ($N / $N_BAR) * ( $N / $N_BAR ) ))
    cc -O2 mainFox.c -o Foxs -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
    srun -n $PROCESSES ./Foxs >> my_controloutput_files${N}_$N_BAR
done
