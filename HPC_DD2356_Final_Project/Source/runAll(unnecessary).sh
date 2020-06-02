#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J AllJob

#SBATCH -t 00:5:00

# Number of nodes
#SBATCH --nodes=32
# Number of MPI processes per node
#SBATCH --ntasks-per-node=64

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell

rm my_output_file*
DEBUG=1
N=4
N_BAR=2
MAX_SIDEVAL=64
for i in 1 2 3
do
    while [ $N -le $MAX_SIDEVAL ]
    do
        N_BAR=2
        while [ $N_BAR -le $(( $N / 2 )) ]
        do
            PROCESSES=$(( ($N / $N_BAR) * ( $N / $N_BAR ) ))
            cc -O2 mainFox.c -o Fox -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
            echo "Size of Compiled File is $(stat -c %s Fox)" >> my_output_file${N}_$N_BAR
            srun -n $PROCESSES ./Fox >> my_output_file${N}_$N_BAR
            N_BAR=$(( $N_BAR * 2))
        done
        N=$(( $N * 2 ))
    done
    N_BAR=$(( $MAX_SIDEVAL / 4 ))
    N=$MAX_SIDEVAL
    MAX_SIDEVAL=$(( $MAX_SIDEVAL * 4 ))
done 