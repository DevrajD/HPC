#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjobAll

#SBATCH -t 00:20:00

# Number of nodes
#SBATCH --nodes=4
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell


cc -O2 Hello.c -o hello -lm
cc -O2 pi_parallel_blocking.c -o piblockin -lm
cc -O2 pi_parallel_nonblocking.c -o pinonblockin -lm
cc -O2 pi_parallel_binaryReduc.c -o pibinaryreduc -lm
cc -O2 pi_reduce.c -o piReduce -lm
cc -O2 pi_gather.c -o piGather -lm
cc -O2 pi_windows.c -o piWindows -lm

for i in 8 16 32 64 128
do
rm my_output_fil$i
srun -n $i ./hello >> my_output_fil$i
rm my_output_piBlockParallel$i
srun -n $i ./piblockin >> my_output_piBlockParallel$i
rm my_output_pi_parallel_nonblocking$i
srun -n $i ./pinonblockin >> my_output_pi_parallel_nonblocking$i
rm my_output_piBinaryTReduc$i
srun -n $i ./pibinaryreduc >> my_output_piBinaryTReduc$i
rm my_output_piReduce$i
srun -n $i ./piReduce >> my_output_piReduce$i
rm my_output_piGather$i
srun -n $i ./piGather >> my_output_piGather$i
rm my_output_piWindows$i
srun -n $i ./piWindows >> my_output_piWindows$i
done
