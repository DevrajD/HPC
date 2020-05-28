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




for i in 9
do

rm my_output_fil$i
rm my_output_filDe$i
cc -O2 mainFox.c -o Fox -lm -D N=6 -D N_BAR=2
srun -n $i ./Fox >> my_output_fil$i
cc -O2 mainFox.c -o Fox -lm -D N=6 -D N_BAR=2 -D DEBUG=2
srun -n $i ./Fox >> my_output_filDe$i
done
