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
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell
# for i in 9 16 32 64 128 256 512 1024 2048 4096 8192 16384
# do
# rm my_output_fil$i
# rm my_output_fil2De$i
# rm my_output_filDe$i

# cc -O2 mainFox.c -o Fox -lm -D N=6 -D N_BAR=2
# srun -n $i ./Fox >> my_output_fil$i
# cc -O2 mainFox.c -o Fox -lm -D N=6 -D N_BAR=2 -D DEBUG=2
# srun -n $i ./Fox >> my_output_fil2De$i
# cc -O2 mainFox.c -o Fox -lm -D N=6 -D N_BAR=2 -D DEBUG=2
# srun -n $i ./Fox >> my_output_filDe$i
# done

rm my_output_file*
DEBUG=1
N=4
N_BAR=2
MAX_SIDEVAL=128
while [ $N -le $MAX_SIDEVAL ]
do
    N_BAR=2
    while [ $N_BAR -le ${N}/2 ]
    do
        PROCESSES=$(( ($N / $N_BAR) * ( $N / $N_BAR ) ))
        cc -O2 mainFox.c -o Fox -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
        srun -n $PROCESSES ./Fox >> my_output_file${N}_$N_BAR
        N_BAR=$(( $N_BAR * 2))
    done
    N=$(( $N * 2 ))
done