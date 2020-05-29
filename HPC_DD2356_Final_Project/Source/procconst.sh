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


PROCESSES=9 #Processes variable must be a perfect square value
DEBUG=1
rm my_constProcoutput_files*
for i in 2 4 6 8 10 16 20 25 32 64 
do
    N_BAR=$(( $i ))
    N=$(( $(bc <<< "scale=0; sqrt($PROCESSES)") * $N_BAR ))
    cc -O2 mainFox.c -o Foxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
    srun -n $PROCESSES ./Foxp >> my_constProcoutput_files${N}_$N_BAR
done
