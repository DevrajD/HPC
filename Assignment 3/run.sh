#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjob

# 10 hours wall-clock time will be given to this job
#SBATCH -t 00:15:00

# Number of nodes
#SBATCH --nodes=8
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell

# Run the executable named myexe
# and write the output into my_output_file
rm my_output_fil
rm my_output_piBlockParallel
rm my_output_pi_parallel_nonblocking
rm my_output_piBinaryTReduc

cc -O2 Hello.c -o hello
cc -O2 pi_parallel_blocking.c -o piblockin
cc -O2 pi_parallel_nonblocking.c -o pinonblockin
cc -O2 pi_parallel_binaryReduc.c -o pibinaryreduc

for processes in  8 16 32 64 128
do
srun -n $processes ./a.out >> my_output_fil
srun -n $processes ./piblockin >> my_output_piBlockParallel
srun -n $processes ./pinonblockin >> my_output_pi_parallel_nonblocking
srun -n $processes ./pibinaryreduc >> my_output_piBinaryTReduc
done
